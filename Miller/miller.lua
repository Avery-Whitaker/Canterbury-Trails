millerGame = Polygamy.state( "Miller" )

men = {}

playerX=0.5

function newMan(i,j)
	table.insert(men, {x = i, y = j})
end

function millerGame.before()
    
	manIMG = love.graphics.newImage("assets/man.png")
	Polygamy.keyboard.use( "Miller" )
    physicsWorld = love.physics.newWorld(-800,-600,800,600,0,1.1)
    
    love.mouse.setVisible(false)
    
for i=0, 10, 1 do
newMan(i/10, 0.5)
end

end

spawnCounter = 0
speed = 0.001
function millerGame.update(dt)
    
playerMove = dt/2
    physicsWorld:update(dt)
spawnCounter = spawnCounter + dt
if spawnCounter > 1 then
spawnCounter = spawnCounter - 1
	newMan(math.random(), -0.25)
	speed = speed*1.01
end

    for key, value in ipairs(men) do
	if(value.y > 1) then
		print("YOU LOSE")
	end

	if(value.x > playerX and value.x < playerX+0.075 and value.y > 0.5) then
		value.hit = true
	end

	if(value.hit == nil or value.hit == false) then
	value.y = value.y + speed
	else 
	if value.y < 0 then table.remove(men,key)end
	value.y = value.y - speed * 10

end
	end
end


Polygamy.keyboard( "Miller" ):setConfig( "held", {
	["right"] = function() playerX = playerX + playerMove end,
	["left"]     = function() playerX = playerX - playerMove end 
})


function millerGame.draw()
gui.preDraw()
    for key, value in ipairs(men) do
	gui.Image{ pos = gui.screenPercent({value.x,value.y}), size= gui.imageSize(0.05, manIMG), image=manIMG }
	--love.graphics.draw(manIMG, gui.screenPercentX(value.x), gui.screenPercentY(value.y))
    end
	gui.Image{ pos = gui.screenPercent({playerX,0.6}), size= gui.imageSize(0.075, manIMG), image=manIMG }
gui.postDraw()
    
end
