welcome = Polygamy.state( "Welcome Screen" )

function welcome.before() 
soundmanager:play(mainMenu)
	Polygamy.keyboard.use( "Welcome Screen" ); 
end

local str
function welcome.update(dt) 

	gui.Label{text = "Canterbury Trails", align="center", pos = gui.screenPercent({0.25,0.1}), size=gui.screenPercent({0.5,0.3}) }

	if gui.Button{text = "Begin Your Pilgrimage", pos=gui.screenPercent({0.25,0.5}), size=gui.screenPercent({0.5,0.5/4}), widgetHit=nil, draw=nil}
 then Polygamy.state.goto("Character Select") end
	if gui.Button{text = "Options", pos=gui.screenPercent({0.25,0.5+(0.5/4)*2}), size=gui.screenPercent({0.5/5,0.5/4}), widgetHit=nil, draw=nil}
 then Polygamy.state.goto("Options") end
	if gui.Button{text = "High Scores", pos=gui.screenPercent({0.25+0.5/5*4,0.5+(0.5/4)*2}), size=gui.screenPercent({0.5/5,0.5/4}), widgetHit=nil, draw=nil}
 then Polygamy.state.goto("High Scores") end
	if gui.Button{text = "Credits", pos=gui.screenPercent({0.25+0.5/5*2,0.5+(0.5/4)*2}), size=gui.screenPercent({0.5/5,0.5/4}), widgetHit=nil, draw=nil}
 then Polygamy.state.goto("Credits") end
--TODO Make font sizes in GUI scale with item size (do biggest font size that fits in space)
	gui.Image{ pos = {0,0}, size= gui.screenPercent({1,1}), image=backgroundIMG }
end

function welcome.draw()
	gui.preDraw()
	gui.postDraw()
end

Polygamy.keyboard( "Welcome Screen" ):setConfig( "pressed", {
	[{" ", "return"}] = function() Polygamy.state.goto("Character Select")       end,
	escape            = function() Polygamy.state.goto("Test Screen") end,
	[Polygamy.default] = print
})

function welcome.after() 
end

