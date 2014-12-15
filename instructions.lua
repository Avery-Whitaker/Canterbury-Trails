local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

instructState = Polygamy.state( "MillerInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Miller Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "You are a carpenter, married to a beautiful young wife. However, there are all sorts of men chasing after her! Your job is to protect your wife from the men by punching them away from her. Watch out for Clever Nicolas and Absalom! Use the arrow keys to move the carpenter left and right. Pick up your wife's hearts for bonus points.", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
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
 gui.Panel{text = "Once upon a time, there were two sworn brothers named Arcite and Palamon who both loved a girl named Emily. The night before, they each prayed for two different blessings, and fought in a tournament for Emily’s hand. You get to choose which blessing to pray for, and then fight other knights for the hand of Emily! Press space as fast as you can when the enemy knight appears, but don't press it when your lady love appears!\n\n\nWould you like to pray for Victory? Or pray for love?", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
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
 gui.Panel{text = "Welcome to SPEED DATE! You represent the Wife of Bath. Today you have five lovely husbands to choose from. You’re going to ask them questions, and they will respond accordingly. Once you think you know which ones best, choose that one for the wife of bath.\nClick on a silhouette to talk to him.", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
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
  love.graphics.draw(wifeBathGameIMG, (gui.screenWidth()-gui.screenWidth()/wifeBathGameIMG:getHeight()/wifeBathGameIMG:getWidth())/8,0, 0, gui.screenWidth()/wifeBathGameIMG:getHeight(), gui.screenHeight()/wifeBathGameIMG:getHeight())
 love.graphics.setColor(0,0,0,255-(timer/5)*255)
  love.graphics.rectangle("fill", gui.xModification(), gui.yModification(), gui.screenWidth(), gui.screenHeight())
  gui.postDraw() 
end

function instructState.after() end




instructState = Polygamy.state( "PriestInstructions" )
function instructState.before() 
  Polygamy.keyboard.use( "PriestInstructions" )
  end
function instructState.update(dt) 
 gui.Label{text = "Nun's Priest Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "Keep safe from the fox! Use your mouse to move Chaunticleer. Survive as long as you can without hitting a wall or being caught. Grab eggs for bonus points!\nPress space to begin!", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

Polygamy.keyboard( "PriestInstructions" ):setConfig( "pressed", {
  [" "]     = function() Polygamy.state.goto("nunsPreist") end 
})

function instructState.after() end


