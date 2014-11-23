welcome = Polygamy.state( "Welcome Screen" )

function welcome.before() 
	Polygamy.keyboard.use( "Welcome Screen" ); 
end

local str
function welcome.update(dt) 
	gui.Image{ pos = {0,0}, size= gui.screenPercent({1,1}), image=background }
	gui.Label{text = "CANTEBURRY TRAILS", align="center", pos = gui.screenPercent({0.25,0.1}), size=gui.screenPercent({0.5,0.3}) }
	gui.Button{text = "BEGIN YOUR PILGRAMAGE", pos=gui.screenPercent({0.25,0.5}), size=gui.screenPercent({0.5,0.5/4}), widgetHit=nil, draw=nil}
	gui.Button{text = "Options", pos=gui.screenPercent({0.25,0.5+(0.5/4)*2}), size=gui.screenPercent({0.5/5,0.5/4}), widgetHit=nil, draw=nil}
	gui.Button{text = "High Scores", pos=gui.screenPercent({0.25+0.5/5*4,0.5+(0.5/4)*2}), size=gui.screenPercent({0.5/5,0.5/4}), widgetHit=nil, draw=nil}
	gui.Button{text = "Credits", pos=gui.screenPercent({0.25+0.5/5*2,0.5+(0.5/4)*2}), size=gui.screenPercent({0.5/5,0.5/4}), widgetHit=nil, draw=nil}
--TODO Make font sizes in GUI scale with item size (do biggest font size that fits in space)
end

function welcome.draw()
	gui.preDraw()
	gui.postDraw()
end

Polygamy.keyboard( "Welcome Screen" ):setConfig( "pressed", {
	[{" ", "return"}] = function() Polygamy.state.goto("Character Select")       end,
	escape            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})

function welcome.after() 
end

