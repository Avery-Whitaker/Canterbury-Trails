
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Credits" )

h = 1

function welcome.before() pkeyboard.use( "Credits" ); print"menu" end
function welcome.update(dt)  --[[ your title update callback ]] h = h- dt*0.1 
if (h < -1 ) then
Polygamy.state.goto("Splash Screen") 
end

end
function welcome.draw()  

	gui.preDraw()

	gui.Label{text = "Canteburry Trails", align="center", pos = gui.screenPercent({0,h}), size=gui.screenPercent({1,0.1}) }
	gui.Label{text = "Credit Text here", align="center", pos = gui.screenPercent({0,h+0.2}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Big Credit Text", align="center", pos = gui.screenPercent({0,h+0.4}), size=gui.screenPercent({1,0.1}) }



	gui.Label{text = "-", align="center", pos = gui.screenPercent({0,h+0.8}), size=gui.screenPercent({1,0.1}) }

	gui.postDraw()
end

pkeyboard( "Credits" ):setConfig( "pressed", {
	[{" ", "return"}] = function() goto("Credits")       end,
	escape            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})


function welcome.after() print"TEST" love.graphics.print("WHAT", 30, 10) love.timer.sleep(3) end

