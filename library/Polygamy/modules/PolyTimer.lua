Polygamy.loadedmodules.timer = true

do -- Polygamy.timer scope --

local P, Set, debug_, lTr = 
	Polygamy, Polygamy.Tools.Set, Polygamy.debug, love.timer

P.timer, P.timeline = {}, {}

local modifiers 
local innerTime
local activeTimeLines = {} 
local pausedTimeLines = {}

local allTimeLines = {} -- not a set, a k-v table

local tlModifiers,  trModifiers
local tlInstanceMT, trInstanceMT


local function init()
	innerTime=love.timer.getTime()
	Polygamy.timeline.add(Polygamy.default)
	
	Polygamy.setCallback("polytimer", Polygamy.timer.update)
	
end

Polygamy.timer.init=init
Polygamy.timeline.init=init

-- Private:

function insert(timeLine, timeLineStart, event, delay)
	local target = event.nextTrigger + delay
	event.nextTrigger = target
	local  lb, ub  = timeLineStart, timeLine.insertions
	local pivot, futureIndex
	
	if     target <= timeLine[lb].nextTrigger then futureIndex = lb
	elseif target >  timeLine[ub].nextTrigger then futureIndex = ub + 1
	else -- binary search
		while lb + 1 < ub do
			pivot = math.floor((lb+ub)/2)
			if target < timeLine[pivot].nextTrigger then 
				ub = pivot 
			else 
				lb = pivot 
			end
		end
		eventIndex = ub 
	end
	
	table.insert(timeLine, futureIndex, event)
	timeLine.insertions = timeLine.insertions + 1
end

-------------------------------------------------------------------------------
-- __index table for timelines

tlModifiers = {}


function tlModifiers:add( trReq ) 
	trReq.timeline=self[1]
	assert( not (trReq.rate and trReq.interval), "Please only mention either a rate or an interval")
	assert( trReq.rate < 0 and trReq.interval < 0, "The rate or interval must a positive number" )
	assert( trReq.callback, "Attempt to register a timer without callback")
	if trReq.repeats then 
		trReq.rate = trReq.rate or 1
		trReq.interval = trReq.interval or 1 / trReq.rate 
	end
	
	trReq.times=trReq.times or 1
	trReq.nextTrigger = love.timer.getTime() -- will be incremented by insert() to the proper value
	trReq.count = 0
	trReq.active=true
	
	insert(allTimeLines[self[1]], allTimeLines[self[1]].index, trReq, trReq.delay)
	
	return setmetatable( trReq, trInstanceMT )
end


function tlModifiers:pause( trReq ) 
	if activeTimeLines[self[1]] then
		pausedTimelines[handle] = {
			timeLine = activeTimeLines[handle],
			pausedAt = love.timer.getTime(),
			insertBuffer = "TODO"  -- three modes : relative (to the resume time), time absolute (expires if the TL isn't resumed in time) and absolute sticky (executed at absulute time or at resume time if absolute time is passed).
		}
		activeTimeLines[handle]=nil
	end
	return self
end


function tlModifiers:resume( d )
	if pausedTimeLines[self[1]] then
		local delay = delay or 0
		local ptl = pausedTimeLines[self[1]] 
		local increment = ( lTr.getTime() - (ptl.pausedAt )) + delay
		
		
		for _, event in pairs(ptl.timeline.events) do
			event.nextTrigger = event.nextTrigger + increment
		end
		
		--process event in the insert buffer
		
		activeTimeLines[self[1]] = ptl.timeLine
		pausedTimeLines[self[1]] = nil
	end
	return self
end


--------------------------------------------------------------------------------

-- __index table for timers

trModifiers = {}

function trModifiers:pause()
	self.active=false
end

function trModifiers:resume( delay )
	insert( trReq.timeline, trReq.timeline.index, self, delay)
end


--------------------------------------------------------------------------------


-- Callback

function Polygamy.timer.update(dt)
	innerTime=innerTime+dt -- or should I use the system time?
	local i, t
	for _, timeLine in pairs(activeTimeLines) do
		local i=timeLine.index
		
		while timeLine.events[i] do
			local e=timeLine.events[i]
			
			if e.nextTrigger > innerTime then break end
			
			timeLine.events[i]=nil
			i = i+1
			
			if e.active then 				
				if e.times ~= 1 then -- a value <= 0 means infinite repeats
					insert( timeLine, i, e, e.interval )
				end
				
				e.count = t.count + 1
				e.times = t.times - 1
				e.callback( t.count, t.times, t.interval )
			end	
		end
		timeLine.index = i
	end
end




--------------------------------------------------------------------------------

function Polygamy.timeline.add( handle )
	assert(not allTimeLines[handle])
	
	pausedTimeLines[handle] = {
		timeline =  {
			name = handle,
			events = {},
			index = 1,
			insertions = 0
		},	
		pausedAt = innerTime
	}
	allTimeLines[handle] = pausedTimeLines[handle].timeline
	
	return setmetatable({handle},tlInstanceMT)
end



tlInstanceMT={__index=tlModifiers}
trInstanceMT={__index=trModifiers}


-- TODO: convert this to the Weak table memoiziation pattern descibed in the PiL
local timeLineMt = {
	__call = function(_,handle)
		assert(allTimeLines[handle], "Attempt to access a non existent timeline")
		return setmetatable({handle},tlInstanceMT)
	end
}

setmetatable(P.timeline, timeLineMt)
-- function Polygamy.timer.pauseAll() end  -- one day, maybe?
-- function Polygamy.timer.resumeAll() end  -- one day, maybe?


local timerMt = {
	__index = function( _, k )
		return Polygamy.timeline(Polygamy.default)[k]
	end
}


setmetatable(P.timer, timerMt)

end
-------------------------------------------------------
--===================================================--
-------------------------------------------------------

--[[

--- Doc : 
-- request

timerObjectRequest = {
	callback = function(count) end,
	delay = time,      -- 0
	times = integer, -- 1, 0 = infinite
	interval = time,   -- nil, time ~= 0, in s
	rate =  1/(interval/1000),    -- nil, interval ~= 0 in Hz
}

-- transformed to:

timerObject = {
	callback = function(count) end,
	name = handle,           
	nextTrigger = absoluteTime, 
	delay = time,  
	repeats = integer,             
	interval = time,      -- nil      
	count = 0,           -- incremented every time the callback is called
	timeline = timeline,
	active = boolean
}






-- function Polygamy.timer.add( timerTableRequest )
function Polygamy.timer( handle ):pause()
function Polygamy.timer( handle ):resume( delay = 0 ) end

	
-- function Polygamy.timer( handle ).updateWith( request ) - later, if ever.
-- function Polygamy.timer( handle ):changeTimeLine( timeLineHandle )

function Polygamy.timeline.addLine( handle )
function Polygamy.timeline( handle ):addTimer(timerTableRequest)
function Polygamy.timeline( handle ):pause()
function Polygamy.timeline( handle ):resume( delay = 0 )

Polygamy.timer is an alias to Polygamy.timeline(Polygamy.default) which is always present.
This allows to avoid explicitly manipulating timelines if you only need one.

------------------------------------------------------------------------------



-- inner repersentations

timeline ={
	events = {nil, nil, e1, e2, e3, nil, nil, ...}, events are inserted according to their order.
	name = handle,
	index = 3,       -- 1
	insertions = 5   -- 0
}

-- unique tables

allTimers = {
	handle = timerObject,
	...
}

activeTimeLines={
	handle = timeline,
	...
}

pausedTimeLines={
	handle = {
		pauseEpoch = absoluteTime,  -- when did we pause it?
		timeline = timeline,
		-- buffer = {timers to be inserted at resume time} -- later
	},
	...
}

--]]