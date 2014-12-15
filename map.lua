
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Map" )

  mapImg = love.graphics.newImage("assets/trail.JPG")

mapText = "Your journy conintues... until you stop for a rest at a small tavern...."

function welcome.before() pkeyboard.use( "Map" ); end
function welcome.update(dt) 
 gui.Label{text = mapText, align = "center", pos = gui.screenPercent({0.1,0}), size = gui.screenPercent({0.8,0.2})}
  if   gui.Button{text = "Close map", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("Menu") 
   end

 gui.Image{ pos = gui.screenPercent({0.2,0.2}), size= gui.screenPercent({0.6,0.6}), image=mapImg }
 
 end
function welcome.draw()
  gui.preDraw()


  gui.postDraw() 
end

pkeyboard( "Map" ):setConfig( "pressed", {
  [{" ", "return"}] = function() goto("Menu")       end,
  escape            = function() love.event.push('quit') end,
  [Polygamy.default] = print
})


function welcome.after() end

