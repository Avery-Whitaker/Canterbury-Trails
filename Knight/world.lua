--[[
world.lua
World

Handles rendering and actions of game world. Moostly just tells entities whats going on

Warning: Do not confuse with physicsWorld, which is the love defined equavalent for physics

--]]

world = {}
world.mouse = {}

function world.mousepressed(x,y,button)
  world.mouse.button = button
end


function world.draw()
  --Draw Entities
  
  love.graphics.setCanvas()
  for key,value in pairs(entityRenderMap) do 
    value:draw()
  end
end

--return the eloveloventity the mouse is over
function world.entityHot()
  world.mouse.x = love.mouse.getX()-xModification()
world.mouse.y = love.mouse.getY()-yModification()
  
  for key,value in pairs(entityRenderMap) do 
    if value:isHot(world.mouse.x, world.mouse.y) then
      
      --Do stuff
      if value.clickBehavior ~= nil then
        value.clickBehavior(button)
      end
      
      return value
    end
  end
end
