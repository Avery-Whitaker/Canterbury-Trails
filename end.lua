theEnd = Polygamy.state( "End" )

function theEnd.before() 
  Polygamy.keyboard.use( "End" ); 
end

  canterburyIMG = love.graphics.newImage("assets/trailBackground.png")
  
  timer = 7
function theEnd.update(dt) 
timer = timer - dt
if timer < 0 then Polygamy.state.goto("Credits") end
  gui.Label{text = "The End", align="center", pos = gui.screenPercent({0.25,0.1}), size=gui.screenPercent({0.5,0.3}) }

  gui.Image{ pos = {0,0}, size= gui.screenPercent({1,1}), image=canterburyIMG }
end

function theEnd.draw()
  gui.preDraw()
  gui.postDraw()
end

Polygamy.keyboard( "End" ):setConfig( "pressed", {
  [{" ", "return"}] = function() Polygamy.state.goto("Character Select")       end,
  escape            = function() Polygamy.state.goto("Test Screen") end,
  [Polygamy.default] = print
})

function theEnd.after() 
end

