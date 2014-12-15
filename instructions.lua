local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

instructState = Polygamy.state( "MillerInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Miller Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "Use the arrow keys to move the carpenter left and right. Keep the men from reaching your wife by blocking them. Pick up your wife's hearts for bonus points.", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if gui.Button{text = "Play", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("Miller") 
   end
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

function instructState.after() end



instructState = Polygamy.state( "KnightInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Knight Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "A knioght must be fast with the best reflexes. In order to win the girl, you will need to be fast! Press space as fast as you can when the enemy knight appears, but dont press it when your lady love appears!\n\n\nWould you like to pray for Victory? Or pray for love?", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if gui.Button{text = "Pray for Victory", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.35,0.05})} then
   Polygamy.state.goto("Knight") 
   end
     if gui.Button{text = "Pray for Love", pos=gui.screenPercent({0.1+0.45,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.35,0.05})} then
   Polygamy.state.goto("Knight") 
   prayForLove = true
   end
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

function instructState.after() end


wifeBathGameIMG = love.graphics.newImage("assets/wifeMiniImage.png")
instructState = Polygamy.state( "WifeOfBathInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Wife of Bath Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "TODO WRITE THIS", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
   if gui.Button{text = "Play", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("WifeOfBathInstructions2") 
   end
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

function instructState.after() end

instructState = Polygamy.state( "WifeOfBathInstructions2" )
function instructState.before() timer = 5 end
function instructState.update(dt) 
timer = timer - dt
 --gui.Image{image = wifeBathGameIMG, pos = gui.screenPercent({0.2,0}), size = gui.screenPercent({0.6,1})}
if timer < 0 then 
   Polygamy.state.goto("wifeBath") 
end
 end
function instructState.draw()
  gui.preDraw()
  love.graphics.draw(wifeBathGameIMG, 0,0, 0, gui.screenWidth()/wifeBathGameIMG:getWidth(), gui.screenHeight()/wifeBathGameIMG:getHeight())
 love.graphics.setColor(255,255,255,125-(timer/5)*125)
  love.graphics.rectangle("fill", gui.xModification(), gui.yModification(), gui.screenWidth(), gui.screenHeight())
  gui.postDraw() 
end

function instructState.after() end




instructState = Polygamy.state( "PriestInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Nun's Priest Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "TODO WRITE THIS", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if gui.Button{text = "Play", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("nunsPreist") 
   end
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

function instructState.after() end


