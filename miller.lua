millerGame = Polygamy.state( "Miller" )

function newMan(i,j, t)
	table.insert(men, {x = i, y = j, status = "down", type = t})
end

function millerGame.before()
  men = {}   
  playerX=0.5
  womanX=0.5
  womanTarget=0.5
  playerW=0.05
  gameScore = 0
  powX=-1
  heartX=-1
  heartBadX=-1
  lose = false
  powTimer = 0
  heartTimer = 0
  womanTimer = 0
  womanTime = 1
  spawnCounter = 0
  speed = 0.001
	Polygamy.keyboard.use( "Miller" )
  physicsWorld = love.physics.newWorld(-800,-600,800,600,0,1.1)
end

function millerGame.after()
  Polygamy.keyboard.use( "" )
  soundmanager:play(stageMusic)
end

function millerGame.update(dt)
  if lose == false then
    gameScore = gameScore + dt*speed*1000
  end
	playerMove = dt*7*0.1
  physicsWorld:update(dt)
	spawnCounter = spawnCounter + dt
	womanTimer = womanTimer - dt
	if womanTimer < 0 and lose == false then
		heartX=womanX
		heartTimer = 0
		womanTarget = math.random()*0.8+0.1
		womanTimer = (math.random()*4+6)*(speed*1000)
		womanTime = womanTimer
	end
	womanX = womanX+ (womanTarget-womanX)*((womanTime-womanTimer)/womanTime)
	if spawnCounter > 1 then
		spawnCounter = spawnCounter - 1
		if math.random() < 0.2 then
		  newMan(math.random()*0.8+0.1, -0.25,"super")
		else
      newMan(math.random()*0.8+0.1, -0.25,"normal")
		end
		speed = speed*1.01
	end
	powTimer = powTimer + dt
	heartTimer = heartTimer + dt
	if(powTimer > 0.1) then 
	  powX = -1 
	end
	if(heartX+playerW > playerX and heartX < playerX+playerW) then
		heartX = -1
		gameScore = gameScore + 20
	end
	if(heartTimer > 3) then
    heartX = -1 
  end
  for key, value in ipairs(men) do
		if(value.y > 0.8) then
			value.status="lost"
			lose = true
			heartBadX = value.x-0.025
			womanTarget = value.x-0.05
		end
		if(value.x+playerW > playerX and value.x < playerX+playerW and value.y > 0.45 and value.status == "down") then
			value.status = "hit"
			powX = value.x
			powTimer = 0
		end    
    if(value.status == "down" and lose == false) then
      if value.type == "super" then
        value.y = value.y + speed*2
      else
        value.y = value.y + speed
      end
		elseif value.status == "hit" or value.status == "down" and lose == true then
      value.y = value.y - speed * 10
		else
		  value.y = 0.8
		end
	end
end

Polygamy.keyboard( "Miller" ):setConfig( "held", {
	["right"] = function() if playerX + playerMove < 1-playerW then playerX = playerX + playerMove end end,
	["left"]     = function() if playerX + playerMove > 0 then playerX = playerX - playerMove end end 
})

function millerGame.draw()
  gui.preDraw()
  if lose == true then
    gui.Panel{text = "GAME OVER", pos = gui.screenPercent({0.4,0.2}), size=gui.screenPercent({0.4,0.2})}
  end
  
	gui.Image{ pos = gui.screenPercent({powX,0.6}), size= gui.imageSize(playerW*1.5, powIMG), image=powIMG }
	gui.Image{ pos = gui.screenPercent({heartX,0.65}), size= gui.imageSize(playerW*1.5, heartIMG), image=heartIMG }
  gui.Image{ pos = gui.screenPercent({heartBadX,0.75}), size= gui.imageSize(playerW*1.5, heartBadIMG), image=heartBadIMG }
  for key, value in ipairs(men) do
    if value.type == "super" then
    	gui.Image{ pos = gui.screenPercent({value.x,value.y}), size= gui.imageSize(0.05, manIMG), image=evilBIMG }
	  else
      gui.Image{ pos = gui.screenPercent({value.x,value.y}), size= gui.imageSize(0.05, manIMG), image=evilAIMG }
	  end
	end
  if lose == false then
	  gui.Panel{ pos = gui.screenPercent({0.2,0}), size= gui.screenPercent({0.2,0.05}), text = "Score: " .. math.floor(gameScore) }
	else
    if gui.Button{text = "Continue", pos=gui.screenPercent({0.4,0.6}), size=gui.screenPercent({0.2,0.5/4}),} then
      Polygamy.state.goto("Menu")
    end
    gui.Panel{ pos = gui.screenPercent({0.2,0.4}), size= gui.screenPercent({0.2,0.05}), text = "Score: " .. math.floor(gameScore) }
	end
	gui.Image{ pos = gui.screenPercent({playerX,0.6}), size= gui.imageSize(playerW, manIMG), image=manIMG }
	gui.Image{ pos = gui.screenPercent({womanX,0.8}), size= gui.imageSize(playerW, womanIMG), image=womanIMG }
	gui.Image{ pos = gui.screenPercent({0,0}), size= gui.screenPercent({1,1}), image=millerBackIMG }
  gui.postDraw()  
end
