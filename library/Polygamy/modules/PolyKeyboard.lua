--[[
--- Polygamy.keyboard ---


-- Examples --


PoG=Polygamy
Polygamy.keyboard=PoG.keyboard

Polygamy.keyboard.add("ingame" {
	left  = function(dt) hero.run(-dt) end,
	right = function(dt) hero.run(dt)  end,
	up    = hero.jump
	[" "] = {
		pressed  = hero.shoot,
		held     = hero.accumulateEnergy,
		released = hero.unleashDevatativeBlow
	},
	esc   = {pressed = game.pause}
},"held") -- "held" is the default action for this definition. 
          -- Valid values: "pressed", "held" and "released". 
          -- "pressed" is used none are specified, as here for example:

Polygamy.keyboard.add("menu",{
	up    = menu.up,
	down  = menu.down,
	enter = menu.activateCurrentItem,
	[PoG.default] = function(k) menu.type(k) end -- useful if the current field is a text field.
})

Polygamy.keyboard.switchTo("menu")


-- API --


Polygamy.keyboard.init() -- sets the love.keypressed and love.keyreleased to Polygamy's equivalents.

Polygamy.keyboard.add(<any> contextName, <table> actions, <string> defaultAction)

Polygamy.keyboard.doto(<any> contextName).setParent(<any> otherContextName) 
Polygamy.keyboard.doto(<any> contextName).replaceWith(<table> actions, <string> defaultAction) -- preserves inheritance
Polygamy.keyboard.doto(<any> contextName).updateWith(<table> actions, <string> defaultAction)
-- the Contexts have to exist already.

Polygamy.keyboard.switchTo(<any> contextName)

Polygamy.keyboard.keyheld(dt) -- call this at the begining the love.update(dt) loop.

-- TODO: 
T TypeMatic.
V Unicode.
V Track the active context (to reset options).
V Reset options on doto actions.
V Pattern matching.
V pass key coordinates to all callbacks.


T Before and (after) blocks. global! (??and targetted?? no!).

V Document inner data structures.

!!! *TEST¨* !!!

T Refactor the family handling

-- Fix the remove key code.

- Implement optimized callbacks, by default or as a per configuration thing. Handle them in doto and switchTo calls.
- Serialization ( /!\ metatables ). => Load/save. Save to a format similar to the input table, not the internal representation.

-- TOLEARN:
- Turn Pölygamy into a module (with submodules?)

-- At Request:
? Polygamy.options? => disable before, after and default... Globally or at the configuration level?

--]]






love=love or {
	handlers={},
	keyboard={setKeyRepeat = function() end}
} -- for debugging
Polygamy.loadedmodules.keyboard = true

-------------------------------------------------------------------------------------
   --===========================--
do --- Polygamy.keyboard scope ---
   --===========================--

local Set, debug_ = Polygamy.Tools.Set, Polygamy.debug

----------------------------------------
-- Upvalues used as private variables --
----------------------------------------
-- Each context is an entry in:
local allContexts = {}
--[[
Context table struncture: actually the reverse of the hierarchy seen from the outside.
<handle> = {
	pressed={
		key=function(key,row,col),
		[ Polygamy.before ]=function(key,row,col,unicode),
		[ Polygamy.default ]=function(key,row,col,unicode)
	},
	released={
		key=function(key,row,col),
		[ Polygamy.before ]=function(key,row,col),
		[ Polygamy.default ]=function(key,row,col)
	},
	held={
		key=function(key,row,col,dt),
		[ Polygamy.default ]=function(key,row,col,dt)
	},
	children={<children handles, if present>} -- TODO: update to family.
}

The main five entries are always present, although the may point to empty tables.

The first four support inheritance, by having the __index of their metatable 
pointing to their parent's counterparts.

The last one is only used when setting/restoring the inheritance chain after a 
modification of a table by a doto function.

???? options={
	[Polygamy.keyRepeat]={0,0},
	[Polygamy.before]=true,  
	[Polygamy.after]=false, 
	[Polygamy.default]=true,
},
--]]


local activeContextHandle


-- Pointers to the tables of the active context.
local aPressedTbl={} -- active "pressed" table
local aReleasedTbl={} -- active "released" table
local aHeldTbl={} -- active "held" table


local heldKeySet={}

local modifiers = {}

-- used for validation or for iteration (or for both).
local keyboardActions=Set:new{"pressed","released","held"}
local keyboardConstants=Set:new{
	Polygamy.default, 
	Polygamy.before, 
	Polygamy.after, 
}

-- Once populated, these tables hold a map of the main keyboard area...
local keyRow={}
local keyCol={}
local keyDiag={}
local rowCol2Key={}
local rowDiag2Key={}

do -- ... let's do that now, actually.
	local qwerty={"1234567890-=", "qwertyuiop[]", "asdfghjkl;'\\", "zxcvbnm,./"}
	local s=""
	
	for rnum, rstring in ipairs(qwerty) do
		rowCol2Key[rnum] = {}
		rowDiag2Key[rnum] = {}
		
		for cnum=1,12 do
			s=string.sub(rstring,cnum,cnum)
			keyRow[s]=rnum
			keyCol[s]=cnum
			keyDiag[s]=cnum+rnum-1
			rowCol2Key[rnum][cnum]=s
			rowDiag2Key[rnum][cnum+rnum-1]=s
		end
	end
		
	rowCol2Key[0] = {}
	
	for i=1,12 do -- Function keys
		keyRow["f"..i]=0
		keyCol["f"..i]=i
		rowCol2Key[0][i]="f"..i
	end
end



---------------------
-- private methods --
---------------------
local addActionsTo, parseKeys,  initCharRangeTables
local validateContext, validateAction
local add, pressedCallback, releasedCallback, heldCallback

local nop = Polygamy.Tools.nop


function parseKeys(p) -- expands the key patterns
	local pat
	if type(p)~= "table" then
		pat = {p}
	else
		pat = p
	end
	
	if keyboardConstants[pat] then return {pat} end -- Since constants are actually tables...
	
	local t = {}
	for _, v in ipairs(pat) do
		
		if type(v)==table and keyboardConstants(v) then
			table.insert(v)
		
		elseif type(v)=="string" then
			local _,_,rangeStartK,rangeEndK=string.find(v,"^%[(.)%-(.)]$") -- ranges for the main keyboard
			local _,_,rangeStartF,rangeEndF=string.find(v,"^%[([Ff]%d+)%-([Ff]%d+)]$") -- for the function keys ranges

			if string.find(v,"^ *%%l *$") then  -- %l
				for n=97, 122 do
					table.insert(t,asc(n))
				end
				
			elseif string.find(v,"^ *%%n *$") then -- %n
				for n=0, 9 do
					table.insert(t,tostring(n))
				end
				
			elseif string.find(v,"^ *%%w *$") then  -- %w
				for n=97, 122 do
					table.insert(t,string.char(n))
				end	
		
				for n=0, 9 do
					table.insert(t,tostring(n))
				end
				
			elseif string.find(v,"^ *%%arrows *$") then -- %arrows
				for _,ar in ipairs{"up", "down", "left", "right"} do
					table.insert(t,ar)
				end
				
			elseif rangeStartK then -- range for the main keyboard area
				
				assert(keyRow[rangeStartK] and keyRow[rangeEndK],
					"Range limits must refer to unaltered US qwerty keys.")
				
				local valid=true
				
				if keyRow[rangeStartK] == keyRow[rangeEndK] then      -- horizontal row
					for i=keyCol[rangeStartK], keyCol[rangeEndK] do
						table.insert(t, rowCol2Key [keyRow [rangeStartK]] [i] )
					end
					
				elseif keyCol[rangeStartK] == keyCol[rangeEndK] then -- vertical row
					local step= keyRow[rangeStartK] <= keyRow[rangeEndK] and 1 or -1
					
					for i=keyRow[rangeStartK], keyRow[rangeEndK], step do
						table.insert(t, rowCol2Key [i] [keyCol [rangeStartK]])
					end
					
				elseif keyDiag[rangeStartK] == keyDiag[rangeEndK] then -- diagonal row
					local step= keyRow[rangeStartK] <= keyRow[rangeEndK] and 1 or -1
					
					for i=keyRow[rangeStartK], keyRow[rangeEndK], step do
						table.insert(t, rowDiag2Key [i] [keyDiag[rangeStartK]])
					end
				else
					valid=false
				end
				
				assert(valid, "A key range must be alligned on a row, column or diagonal (see documentation)")
				
			elseif rangeStartF then                 -- ranges for the function keys
				local s,e=string.sub(rangeStartF,2,-1) + 0, string.sub(rangeEndF,2,-1) + 0
				
				assert(s>0 and s<13 and e>0 and s<13, 
					"\"f"..s.."\" and/or f"..e.." : invalid function key")
					
				for i= s,e do
					table.insert( t, "f"..i )
				end
				
			elseif string.find( v,"^%[.+]$" ) then        -- set of letters
				local b
				
				for i = 2, (#v - 1) do
					local key = string.sub( i, i )
					b = string.byte(key)
					
					if ( b > 97 ) and ( b < 122 ) then 
						table.insert(t,key)
					end
				end
								
			else                                         -- other strings are considered to be key constants.
				table.insert(t,v)
			end
		
		else 
			error( "A valid key in definition table can be either a LOVE key constant, \na Polygamy.keyboard pattern or constant (Polygamy.default, etc...), \nor an array of the former elements." )
		end
	end
	return t 
end




function validateContext(context)
	
	assert( allContexts[context], 
		"\""..tostring(context).."\" is not a valid keyboard context")
		
	return context
end

function validateAction(action)
	
	assert( keyboardActions[action], 
		"\""..tostring(action).."\" is not a valid keyboard action")
		
	return action
end


--------------------------------------------------
-- These will become public at various points . --
--------------------------------------------------

function useBasic(handle)
	debug_("UseBasic",tostring(handle))
	validateContext(handle)
	
	activeContextHandle=handle
	
	aPressedTbl  = allContexts[handle].pressed
	aReleasedTbl = allContexts[handle].released
	aHeldTbl     = allContexts[handle].held
end

function useInit(handle)
	debug_"UseInit"
	Polygamy.handlersBackup.kp = love.handlers.keypressed
	Polygamy.handlersBackup.kr = love.handlers.keyreleased
	
	love.handlers.keypressed = pressedCallback
	love.handlers.keyreleased = releasedCallback
	
	debug_"Insert heldCallback"
	Polygamy.setCallback("polykeyheld",heldCallback)
	
	Polygamy.keyboard.use=useBasic
	useBasic(handle)
end

-----------------------------------------------------------------------
-- Function active on the context to be modified (dotoContextHandle) --
-- which is set by the __call metamethod                             --
-----------------------------------------------------------------------


  -- they all act on dotoContextHandle which is defined in Polygamy.kyboard.doto


function modifiers.setParent(self, parHandle)
	local child,parent=allContexts[self[1]], allContexts[parHandle]

	if child.family.parent then --remove the child from the previous parent's list
		allContexts[child.family.parent].family.children[dotoContextHandle]=nil
	end

	for action in pairs(keyboardActions) do
		setmetatable(child[action],{__index=parent[action]})
	end

	child.family.parent=parHandle
	parent.family.children[self[1]]=true
end
	
	
function modifiers.setConfig(self, defaultAction, T )
	validateAction( defaultAction ) 
	local context = allContexts[self[1]]
	
	for keys, definition in pairs(T) do
		
		if type(definition) == "function" then
			for _, k in ipairs(parseKeys(keys)) do 
				context[defaultAction][k]=definition
			end

		elseif type(definition)=="table" then
			for action in pairs(definition) do
				validateAction(action)
				if type(definition[action])=="function" then
					for _, k in ipairs(parseKeys(keys)) do
						context[action][k]=definition[action]
					end
				else -- remove that keys/action pair if definition[action] is specified and is not a function.
					for _, k in ipairs(parseKeys(keys)) do
						context[action][k]=nil			
					end 
				end 
			end

		else --remove these keys FIXME !!
			for _,k in ipairs(parseKeys(keys)) do
				context[defaultAction][k]=nil
			end
		end
	end
end


---------------
-- Callbacks --
---------------

-- Since heldCallback is called every frame, speed prevails on orthogonality.


function pressedCallback(key,unicode)
	heldKeySet[key]=true
	
	;( aPressedTbl[Polygamy.before] or nop 
		)(key, keyRow[key], keyCol[key], unicode)
	
	;( aPressedTbl[key] or aPressedTbl[ Polygamy.default ] or nop 
		)( key, keyRow[key], keyCol[key], unicode )
end

function releasedCallback(key)
	
	(aReleasedTbl[Polygamy.before] or nop
		)( key, keyRow[key], keyCol[key])
	
	heldKeySet[key]=nil
	
	;(aReleasedTbl[key] or nop 
		)( key, keyRow[key], keyCol[key] )
end

function heldCallback(dt) 	
	for key in pairs(heldKeySet) do
		
		( aHeldTbl[key] or nop 
			)( key, keyRow[key], keyCol[key], dt )
	end
end

---[==[
--------------------------
-- The public interface --
--------------------------

Polygamy.keyboard={
	add = function(handle)              -- actually a setup function the first time it is called.
		
		if allContexts[handle] then 
			error("Polygamy.Keyboard.add: \""..tostring(handle)..
				"\" is already defined") 
		end

		
	end,
					
	use = useInit,
	
	-- isDown = function(key) return heldKeySet[key] end,
	
	makeLove=function()
		love.handlers.keypressed = Polygamy.handlersBackup.kp
		love.handlers.keyreleased = Polygamy.handlersBackup.kr
		Polygamy.removeCallback( "keyheld" )
		Polygamy.keyboard.use=useInit
	end
} 

setmetatable(Polygamy.keyboard,{
	__call = function(_,handle)
		if allContexts[ handle ] then 
			return setmetatable( {handle}, { __index = modifiers} )
		else
			local context = {family = {children = {} } }

			for action in pairs(keyboardActions) do
				context[action]={}
			end

			allContexts[handle] = context
			return setmetatable( {handle}, {__index = modifiers} )
		end
	end
})

--]==]
--===============================--
end --- Polygamy.keyboard scope ---
--===============================--
