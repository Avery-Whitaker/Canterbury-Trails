knightGame = Polygamy.state( "Knight" )

prayForLove=false

function knightGame.before()
soundmanager:play(knightGameMusic)
  Polygamy.keyboard.use( "Knight" )
  ladyIMG = love.graphics.newImage("assets/lady.png")
  enemyIMG = love.graphics.newImage("assets/enemyKnight.png")
  gameScore = 0
  timer = 0
  flashTimer = 0
  speedMod = 0.5
  loseText = ""
  lose = false
  if prayForLove == true then
  prayText = "You faught valiatly, you were defeated, but your oponet fell of his horse! You get the girl and 50 bonus points!"
  else
  prayText = "You faught valiatly, but your lady love is not to be yours."
  end
end

popup = "none"
-- lady
-- enemy


function knightGame.update(dt)
  timer = timer + dt*speedMod
  speedMod = speedMod + dt/10
  
  flashTimer = flashTimer - dt*speedMod
  
  if lose == false then
  gameScore = gameScore + dt*speedMod
  end
  if popup == "enemy" and timer > 2 and lose == false then
    lose = true
    loseText = "TOO SLOW"
  end
  
  if popup == "lady" and timer > 2 and lose == false then
    popup = "none"
    timer = 0
  end
  
  if popup == "none" and timer > 3 and lose == false then
    if math.random() > 0.6 then
      popup = "enemy"
    else
      popup = "lady"
    end
    timer = -math.random()*5
  end
  
  
end

lose = false

Polygamy.keyboard( "Knight" ):setConfig( "pressed", {
  [" "] = function() 
  if lose == false then
    if popup == "none" then
    flashTimer = 0.5
    loseText = "TOO EARLY"
    lose = true
    elseif popup == "enemy" then
    flashTimer = 0.5
   popup = "none"
   timer = -1
   elseif popup == "lady" then
    flashTimer = 0.5
    loseText = "YOU HIT THE LADY"
     lose = true
     end
     end
   end
})


function knightGame.draw()
gui.preDraw()


  if lose == true then
  
  if prayForLove == true then gameScore = gameScore + 50
  prayForLove = false end
  
gui.Panel{text = "GAME OVER - " .. loseText .. "\n" .. prayText, pos = gui.screenPercent({0.4,0.2}), size=gui.screenPercent({0.4,0.2})}
  
--   gui.Panel{ pos = gui.screenPercent({0.4,0.2}), size= gui.screenPercent({0.4,0.2}), text = "YOU LOSE Score: " .. math.floor(gameScore) }
  end

if flashTimer > 0 then
 love.graphics.setColor(255,255,255,(flashTimer/0.5)*255)
  love.graphics.rectangle("fill", gui.xModification(), gui.yModification(), gui.screenWidth(), gui.screenHeight())
end  

  if popup == "enemy" and lose == false then
   -- gui.Label{text="PRESS SPACE", align = "middle", pos = gui.screenPercent({0.25,0.9}), size= gui.screenPercent({0.5,0.1}), image=enemyIMG }
    gui.Image{ pos = gui.screenPercent({0.25,0.1}), align = "center", size= gui.imageSize(0.5, enemyIMG), image=enemyIMG }
    
  elseif popup == "lady" and lose == false then
    gui.Image{ pos = gui.screenPercent({0.25,0.1}), size= gui.imageSize(0.5, ladyIMG), image=ladyIMG }
  end
  
  if lose == false then
   gui.Panel{text = "", pos = gui.screenPercent({0.25,0.1}), size=gui.screenPercent({0.5,0.9})}
 end
 
    if lose == false then
   gui.Panel{ pos = gui.screenPercent({0.2,0}), size= gui.screenPercent({0.2,0.05}), text = "Score: " .. math.floor(gameScore) }
   
 
  else
if gui.Button{text = "Continue", pos=gui.screenPercent({0.4,0.6}), size=gui.screenPercent({0.2,0.5/4}),}
 then Polygamy.state.goto("Menu") end
   gui.Panel{ pos = gui.screenPercent({0.2,0.4}), size= gui.screenPercent({0.2,0.05}), text = "Score: " .. math.floor(gameScore) }
  end
    
gui.postDraw()
    
end
