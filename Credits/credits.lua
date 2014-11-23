
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Credits" )

function welcome.before() pkeyboard.use( "Credits" ); print"menu" end
function welcome.update(dt)  --[[ your title update callback ]] end
function welcome.draw()    love.graphics.print("Credits", 10, 10)  --[[ draw your fine title here  ]] end

pkeyboard( "Credits" ):setConfig( "pressed", {
	[{" ", "return"}] = function() goto("Credits")       end,
	escape            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})


function welcome.after() print"TEST" love.graphics.print("WHAT", 30, 10) love.timer.sleep(3) end

