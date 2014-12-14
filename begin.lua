
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

begin = state( "Begin" )

  mapIMG = love.graphics.newImage("assets/trail.JPG")
  
beginLogo = love.graphics.newImage("assets/splashLogo.png")

function begin.before() pkeyboard.use( "Map" ); end
function begin.update(dt) 
 gui.Label{text = "HERE BEGINS", align = "center", pos = gui.screenPercent({0.1,0.2}), size = gui.screenPercent({0.8,0.2})}
 gui.Label{text = "THE TRAILS OF CANTERBURY", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.2})}
  if   gui.Button{text = "Next", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("Begin2") 
   end

-- gui.Image{ pos = gui.screenPercent({0.2,0.2}), size= gui.screenPercent({0.6,0.6}), image=beginLogo }
 
 end
function begin.draw()
  gui.preDraw()


  gui.postDraw() 
end

pkeyboard( "Map" ):setConfig( "pressed", {
  [{" ", "return"}] = function() goto("Menu")       end,
  escape            = function() love.event.push('quit') end,
  [Polygamy.default] = print
})


function welcome.after() end






begin = state( "Begin2" )

  mapIMG = love.graphics.newImage("assets/trail.JPG")
  
beginLogo = love.graphics.newImage("assets/splashLogo.png")

function begin.before() pkeyboard.use( "Map" ); end
function begin.update(dt) 
 gui.Panel{text = "Your name is Geoffrey Chaucer. It is currently the month of April. The sun is rising, the birds are chirping. Spring, your favorite season, is here, and you absolutely love everyone. You are currently residing at the Tabard in Southwark, on your way to the Canterbury Cathedral. The place is INN-credibly crowded, as a large, rowdy group of twenty-nine people have just arrived. ", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if   gui.Button{text = "Approach the group.", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("Begin3") 
   end

-- gui.Image{ pos = gui.screenPercent({0.2,0.2}), size= gui.screenPercent({0.6,0.6}), image=beginLogo }
 
 end
function begin.draw()
  gui.preDraw()


  gui.postDraw() 
end

pkeyboard( "Map" ):setConfig( "pressed", {
  [{" ", "return"}] = function() goto("Menu")       end,
  escape            = function() love.event.push('quit') end,
  [Polygamy.default] = print
})


function welcome.after() end





begin = state( "Begin3" )

  mapIMG = love.graphics.newImage("assets/trail.JPG")
  
beginLogo = love.graphics.newImage("assets/splashLogo.png")

function begin.before() pkeyboard.use( "Map" ); end
function begin.update(dt) 
 gui.Panel{text = "You met a lot of people, and thought they were all wonderful characters. You’ll learn more about them later. They invite you to join their party when they realize you also plan to travel to Canterbury.", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if   gui.Button{text = "Begin Journy", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("Traveling") 
   end

-- gui.Image{ pos = gui.screenPercent({0.2,0.2}), size= gui.screenPercent({0.6,0.6}), image=beginLogo }
 
 end
function begin.draw()
  gui.preDraw()


  gui.postDraw() 
end

pkeyboard( "Map" ):setConfig( "pressed", {
  [{" ", "return"}] = function() goto("Menu")       end,
  escape            = function() love.event.push('quit') end,
  [Polygamy.default] = print
})


function welcome.after() end

