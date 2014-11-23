
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Options" )

function welcome.before() pkeyboard.use( "Options" ); print"menu" end
function welcome.update(dt)  --[[ your title update callback ]] end
function welcome.draw()    love.graphics.print("TITLE SCREEN", 10, 10)  --[[ draw your fine title here  ]] end

pkeyboard( "Options" ):setConfig( "pressed", {
	[{" ", "return"}] = function() goto("Options")       end,
	escape            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})


function welcome.after() print"TEST" love.graphics.print("WHAT", 30, 10) love.timer.sleep(3) end

