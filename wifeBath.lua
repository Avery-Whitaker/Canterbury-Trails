
prospectsImage = love.graphics.newImage("assets/prospects.png")

prospect = {}
prospect[1] = {}
prospect[2] = {}
prospect[3] = {}
prospect[4] = {}
prospect[5] = {}
prospect[1].text = {}
prospect[2].text = {}
prospect[3].text = {}
prospect[4].text = {}
prospect[5].text = {}

prospect[1].image = love.graphics.newImage("assets/prospect1.png")
prospect[1].text[1] = "Oh I am very rich, very rich indeed."
prospect[1].text[2] = "Absolutely. I will not hold back from making sure my wife has a strong dowry."
prospect[1].text[3] = "Looks, for sure."
prospect[1].text[4] = " I don’t do much, but I certainly like spreading the wealth."
prospect[1].name = "Mystery Man 1"
prospect[2].name = "Mystery Man 2"
prospect[3].name = "Mystery Man 3"
prospect[4].name = "Mystery Man 4"
prospect[5].name = "Mystery Man 5"

prospect[2].image = love.graphics.newImage("assets/prospect2.png")
prospect[2].text[1] = "I am the owner of huge tracts of land, and I have invested my wealth well."
prospect[2].text[2] = "Certainly! She can have it all."
prospect[2].text[3] = "Looks, definitely, as well as a meek personality."
prospect[2].text[4] = "I’m fairly gullible, to be honest."

prospect[3].image = love.graphics.newImage("assets/prospect3.png")
prospect[3].text[1] = "I am old, and have accumulated much wealth over the span of my life."
prospect[3].text[2] = "Yes, certainly. A woman must have riches."
prospect[3].text[3] = "Looks, and I hope that my wife doesn’t have a strong will."
prospect[3].text[4] = "I’m generally a nice guy."

prospect[4].image = love.graphics.newImage("assets/prospect4.png")
prospect[4].text[1] = "Enough to support myself and a wife."
prospect[4].text[2] = "Not much, why would I need to?"
prospect[4].text[3] = "Looks, all the way. I don’t even think marriage is that important. What if you find a woman prettier than your wife? Wouldn’t you make her your mistress?"
prospect[4].text[4] = "I’m alright at lying, and I think cheating is okay."

prospect[5].image = love.graphics.newImage("assets/prospect5.png")
prospect[5].text[1] = "Not much, not much at all. I am a cleric from Oxford, though."
prospect[5].text[2] = "I don’t have much to give! She should give money to me. Women don’t need wealth."
prospect[5].text[3] = "Both, but love certainly is very important."
prospect[5].text[4] = "I’m a pretty violent person, and I love to read books that put women in their proper place."

prospect[1].chosenText = "This man provides the Wife of bath with money, but no more."
prospect[1].points = 200
prospect[2].chosenText = "This man provides the Wife of bath with money, but no more."
prospect[2].points = 200
prospect[3].chosenText = "This man provides the Wife of bath with money, but no more."
prospect[3].points = 200
prospect[4].chosenText = "Despite his personality, the Wife of Bath and him are sortof happy together."
prospect[4].points = 300
prospect[5].chosenText = "Despite his faults, the Wife of Bath loves him dearly."
prospect[5].points = 500

function newProspectState(w)
--name


prospectState = Polygamy.state( w.name )

function prospectState.before()
    
prospect[1].currentText = ""
prospect[2].currentText = ""
prospect[3].currentText = ""
prospect[4].currentText = ""
prospect[5].currentText = ""
  Polygamy.keyboard.use( w.name )


end


function prospectState.update(dt)

 gui.Label{text = w.name, align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.4,0.1})}
 if gui.Button{text = "Look at other men", pos = gui.screenPercent({0.4,0.9}), size = gui.screenPercent({0.5,0.05}) } then
   Polygamy.state.goto( "wifeBath" )
 end
 
  if gui.Button{text = "CHOOSE " .. w.name .. "!", pos = gui.screenPercent({0.4,0.8}), size = gui.screenPercent({0.5,0.05}) } then
    decision = w
   Polygamy.state.goto( "wifeBathDecision" )
 end
 
  if gui.Button{text = "How much money do you have?", pos = gui.screenPercent({0.6,0.05}), size = gui.screenPercent({0.3,0.05}) } then
    w.currentText = w.text[1]
 end
 
  if gui.Button{text = "Would you give money to your wife?", pos = gui.screenPercent({0.6,0.15}), size = gui.screenPercent({0.3,0.05}) } then
    w.currentText = w.text[2]
 end
 
  if gui.Button{text = "Would you marry for love or for looks?", pos = gui.screenPercent({0.6,0.25}), size = gui.screenPercent({0.3,0.05}) } then
    w.currentText = w.text[3]
 end
 
  if gui.Button{text = "Talk about your personality?", pos = gui.screenPercent({0.6,0.35}), size = gui.screenPercent({0.3,0.05}) } then
    w.currentText = w.text[4]
 end
 
 gui.Panel{text = w.currentText, pos =  gui.screenPercent({0.6,0.45}), size = gui.screenPercent({0.3,0.3}) }
 
end

Polygamy.keyboard( w.name ):setConfig( "held", {
  ["right"] = function() if playerX + playerMove < 1-playerW then playerX = playerX + playerMove end end,
  ["left"]     = function() if playerX + playerMove > 0 then playerX = playerX - playerMove end end 
})

function prospectState.draw()
gui.preDraw()
 
 
 
  gui.Image{image = w.image,  pos = gui.screenPercent({0.1,0.1}), size = gui.imageSize(0.3,w.image)}
gui.postDraw()
    
end

end

newProspectState(prospect[1])
newProspectState(prospect[2])
newProspectState(prospect[3])
newProspectState(prospect[4])
newProspectState(prospect[5])

wifeBathGame = Polygamy.state( "wifeBath" )

function wifeBathGame.before()
    decision = 0
  Polygamy.keyboard.use( "wifeBath" )


end


function wifeBathGame.update(dt)

if love.mouse.isDown("l") then
  if love.mouse.getX() > gui.screenPercentX(0) and love.mouse.getX() < gui.screenPercentX(0.2) then
   Polygamy.state.goto(prospect[1].name)   
  elseif love.mouse.getX() > gui.screenPercentX(0.2) and love.mouse.getX() < gui.screenPercentX(0.4) then
   Polygamy.state.goto(prospect[2].name)    
  elseif love.mouse.getX() > gui.screenPercentX(0.4) and love.mouse.getX() < gui.screenPercentX(0.6) then
   Polygamy.state.goto(prospect[3].name)    
  elseif love.mouse.getX() > gui.screenPercentX(0.6) and love.mouse.getX() < gui.screenPercentX(0.8) then
   Polygamy.state.goto(prospect[4].name)    
  elseif love.mouse.getX() > gui.screenPercentX(0.8) and love.mouse.getX() < gui.screenPercentX(1) then
   Polygamy.state.goto(prospect[5].name)   
   end
  
end

  gui.Image{image = prospectsImage,  pos = gui.screenPercent({0,0}), size = gui.imageSize(1,prospectsImage)}
end

Polygamy.keyboard( "wifeBath" ):setConfig( "held", {
  ["right"] = function() if playerX + playerMove < 1-playerW then playerX = playerX + playerMove end end,
  ["left"]     = function() if playerX + playerMove > 0 then playerX = playerX - playerMove end end 
})

function wifeBathGame.draw()
gui.preDraw()

gui.postDraw()
    
end


wifeBathDecision = Polygamy.state( "wifeBathDecision" )

function wifeBathDecision.before()
    
  Polygamy.keyboard.use( "wifeBathDecision" )


end


function wifeBathDecision.update(dt)

 gui.Label{text = decision.name .. " married!", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.4,0.1})}
 if gui.Button{text = "Done", pos = gui.screenPercent({0.4,0.9}), size = gui.screenPercent({0.5,0.05}) } then
   Polygamy.state.goto( "Menu" )
 end
 
 gui.Panel{text = "YOU CHOOSE " ..  decision.name .. ".\n\n" .. decision.chosenText .. "\n\nYour score: " .. decision.points, pos =  gui.screenPercent({0.6,0.45}), size = gui.screenPercent({0.3,0.3}) }
 


  gui.Image{image = decision.image,  pos = gui.screenPercent({0.1,0.1}), size = gui.imageSize(0.3,decision.image)}
end

Polygamy.keyboard( "wifeBathDecision" ):setConfig( "held", {
  ["right"] = function() if playerX + playerMove < 1-playerW then playerX = playerX + playerMove end end,
  ["left"]     = function() if playerX + playerMove > 0 then playerX = playerX - playerMove end end 
})

function wifeBathDecision.draw()
gui.preDraw()

gui.postDraw()
    
end

--[[States
  Main (the five guys and option to explore one
    person n
      option to marry person
      ask question
      How much money do you have? --]] 