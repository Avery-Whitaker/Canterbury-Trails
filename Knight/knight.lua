knightGame = Polygamy.state( "Knight" )

require "Knight/entity"
require "Knight/world"

function knightGame.before()

  IMG_HALL = love.graphics.newImage("assets/hall.png")
  IMG_CORE = love.graphics.newImage("assets/core.png")
  IMG_AST = love.graphics.newImage("assets/asteroid.png")
  IMG_CREW = love.graphics.newImage("assets/crew.png")
  love.physics.setMeter(20)
  physicsWorld = love.physics.newWorld(0, 0, true)
    
  testEntity1 = newEntity(70,0,"assets/core.png")
  testEntity1:attachPhysicsShape(love.physics.newRectangleShape(IMG_CORE:getWidth(),IMG_CORE:getHeight()), 1)
  testEntity2 = newEntity(200,0,"assets/core.png")
  testEntity2:attachPhysicsShape(love.physics.newRectangleShape(IMG_CORE:getWidth(),IMG_CORE:getHeight()), 1)
  testEntity3 = newEntity(400,0,"assets/hall.png") -- 200,50
  testEntity3:attachPhysicsShape(love.physics.newRectangleShape(IMG_CORE:getWidth(),IMG_CORE:getHeight()), 1)
  
  testEntity3.clickBehavior = function (self)
    print("yolo3") --why yolo... 
  end
  testEntity2.clickBehavior = function (self)
    print("yolo2")
  end
  testEntity1.clickBehavior = function (self)
    print("yolo1")
  end
  
  entity.linkEntities(testEntity1, testEntity2, love.physics.newRevoluteJoint(testEntity1:getPhysicsBody(),testEntity2:getPhysicsBody(),75,30,false) )
  
  entity.linkEntities(testEntity1, testEntity3, love.physics.newRevoluteJoint(testEntity3:getPhysicsBody(),testEntity2:getPhysicsBody(),125,30,false) )

	Polygamy.keyboard.use( "Knight" )
    pWorld = love.physics.newWorld(-800,-600,800,600,0,1.1)

    love.mouse.setVisible(false)
    
end

function knightGame.update(dt)
    
 --[[ hoverEntity = world.entityHot()
  physicsWorld:update(dt)
  
  if testEntity1 == hoverEntity then
      local mx,my = love.mouse.getPosition()
  qGui.Panel{size = {"tight","tight"},  pos = {mx+10,my-20}, text = "Wow look at this tooltip"}
  end
  
  qGui.Label{text = "Current FPS: "..tostring(love.timer.getFPS( )), pos = {10,5}}
  --]]
        
end


Polygamy.keyboard( "Knight" ):setConfig( "pressed", {
	[" "] = function() game:shoot()       end,
	["escape"]            = function() love.event.push('quit') end,
	[Polygamy.default] = function()    
    if game.game_over and game.audio.over:isStopped() then
        game:startOver()
    end
end
})


function knightGame.draw()

	gui.preDraw()

	world.draw()
  

	gui.postDraw()
    
end
