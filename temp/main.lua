--[[
main.lua
Main

Contains functions for initilization and game loop

TESTKEY1

--]]

-----------------------------------------------------------
require('camera')
require('world')
require('gui')
require('soundmanager')
require('entity')
require('affine')
require('background')
require('run')
require('graphics')
require('minimap')
qGui = require "quickie"
-----------------------------------------------------------

function love.load()
  print("-SYSTEM PRINT-")
  gameState = "run"
  IMG_HALL = love.graphics.newImage("assets/long.png")
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
  
  --[[
  entity.linkEntities(testEntity1, testEntity2, love.physics.newRevoluteJoint(testEntity1:getPhysicsBody(),testEntity2:getPhysicsBody(),75,30,false) )
  
  entity.linkEntities(testEntity1, testEntity3, love.physics.newRevoluteJoint(testEntity3:getPhysicsBody(),testEntity2:getPhysicsBody(),125,30,false) )
--]]

  love.mouse.setGrabbed(true)
  
  fonts = {
    [12] = love.graphics.newFont(12),
    [20] = love.graphics.newFont(20),
  }
  love.graphics.setFont(fonts[12])
  
end

function love.mousepressed(x,y,button)
  if gameState == "run" then
    if button == "wd" then
      camera:zoom(x,y,-0.066)
    elseif button == "wu" then
      camera:zoom(x,y,0.066)
    end
    
    --next render cycle check world
    world.mousepressed(x,y,button)
  end
end
  
function love.focus(f)
end
  
function love.keypressed(key)
  qGui.keyboard.pressed(key)
  
  if key == "escape" then
    love.mouse.setGrabbed(false)
    gameState = "pause"
  end
  
end

function love.keyreleased(key)
end

function love.mousereleased(x,y,button)
end

function love.textinput(str)
    qGui.keyboard.textinput(str)
end

--return false to quit
--return true to refuse to quit
function love.quit()
  return false
end
  
function love.update(dt)
  
  hoverEntity = world.entityHot()
  camera.update()
  physicsWorld:update(dt)
  
  if testEntity1 == hoverEntity then
      local mx,my = love.mouse.getPosition()
  qGui.Panel{size = {"tight","tight"},  pos = {mx+10,my-20}, text = "Wow look at this tooltip"}
  end
  
  qGui.Label{text = "Current FPS: "..tostring(love.timer.getFPS( )), pos = {10,5}}
  
end

function love.draw()
  camera:set()
  background.draw()
  world.draw()
  
  camera:unset()
  minimap:setMini(camera)
  world.drawMini()
  camera:unset()
  
  minimap.draw()
  qGui.core.draw()
end