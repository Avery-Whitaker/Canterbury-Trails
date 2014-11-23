--[[
state={
	before = function( from, to, ... ) end,
	
	update = function(dt) end,
	draw   = function() end,
	
	after  = function( from, to, ... ) end
}
--]]
local Set, debug_ = Polygamy.Tools.Set, Polygamy.debug
local swallow = Polygamy.Tools.swallow
Polygamy.state = {}
Polygamy.loadedmodules.state = true

--======================--
do -- Polygamy.state --
--======================--
local currentState = Polygamy.default
local allStates = {[Polygamy.default] = {} }
local clear = love.graphics.clear
local draw = Polygamy.nop
local stateModifiers

function Polygamy.state.init()
end


-- TODO

stateModifiers = {
	setOptions = function(self,table)
		for k,v in table do
			
		end
	end,
	
	setParent = function(self, parentHandle)
		
	end,
	
	parent = function(self)
	
	end
}

function Polygamy.state.goto( destination, ... )
	debug_("goto",destination)
	debug_(allStates[destination].before)
	assert( allStates[destination], "Non existent state: " .. destination )
	local nop = Polygamy.Tools.nop
	
	Polygamy.scheduleTransition( (allStates[currentState].after or nop), swallow(currentState, destination, ...) )
		
	if allStates[destination].update then 
		Polygamy.setCallback("update",allStates[destination].update) end

	if allStates[destination].draw then 
		Polygamy.setCallback("draw",allStates[destination].draw) end
	
	Polygamy.scheduleTransition( (allStates[destination].before or nop), swallow(currentState, destination, ...) )
	
	currentState=destination
end



function Polygamy.state.makeLove()
	Polygamy(Polygamy.default).update=love.update
	Polygamy(Polygamy.default).draw=love.draw
	Polygamy.goto(Polygamy.default)
end

local shtlmt = {__index=stateModifiers}

local pSmt = {__call = function( _, handle ) 
	if not allStates[handle] then
		allStates[handle] = {}
	end
	return allStates[handle]
end}



setmetatable(Polygamy.state, pSmt)

--=======================--
end -- Polygamy.state --
--=======================--

