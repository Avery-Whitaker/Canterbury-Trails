
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Menu" )

function welcome.before() pkeyboard.use( "Menu" ); print"menu" end
function welcome.update(dt)  --[[ your title update callback ]] end
function welcome.draw()    love.graphics.print("Menu", 10, 10)  --[[ draw your fine title here  ]] end

pkeyboard( "Menu" ):setConfig( "pressed", {
	[{" ", "return"}] = function() goto("Menu")       end,
	escape            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})


function welcome.after() print"TEST" love.graphics.print("WHAT", 30, 10) love.timer.sleep(3) end

