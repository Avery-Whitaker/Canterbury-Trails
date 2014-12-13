--[[
entity.lua
Entity

Class for all worldy objects

--]]
entity = {} 
entity.__index = entity

--Key -> Height (integer), Value -> entity
--All Entities in this table are renderd IN ORDER, the order is set by linking entities
entityRenderMap = {}

function newEntity(x,y,url)
  local self = setmetatable({}, entity)
  self.physicsBody = love.physics.newBody(physicsWorld, x, y, "dynamic")
  self.image = love.graphics.newImage(url)
  physicsFixtures = {}
  self.belowMe = {}
  table.insert(entityRenderMap, self)
  self.clickBehavior = nil
  self.height = #entityRenderMap -- Index in entityRenderMap
  
  return self
end

function entity:getPhysicsBody()
  return self.physicsBody
end

function entity:attachPhysicsShape(shape, density)
  table.insert(physicsFixtures, love.physics.newFixture(self.physicsBody, shape, density))
end

-- Entity 1 is assumed to be on top of entity2
-- New links always overide old links in terms of rendering height
function entity.linkEntities(entity1, entity2, joint)
  table.insert(entity1.belowMe, entity2)
  --if already in right order, celebrate!
  if entity1.height > entity2.height then
    return
  end
  entity1:correctHeight()
end

function entity:correctHeight()
  table.remove(entityRenderMap, self.height)
  for i=self.height, #entityRenderMap, 1 do
    entityRenderMap[i].height = entityRenderMap[i].height - 1
  end
  local min = 0
  for key,value in pairs(self.belowMe) do 
    if min == nill or min > value.height then
      min = value.height
    end
  end
  self.height = min + 1
  table.insert(entityRenderMap, self.height, self)
  for i=self.height, #entityRenderMap, 1 do
    entityRenderMap[i].height = entityRenderMap[i].height + 1
  end
end

-- Draw entity
function entity:draw()
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(self.image, self.physicsBody:getX(), self.physicsBody:getY(), self.physicsBody:getAngle(), 1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end

--Draw solid color too scale of image
function entity:drawMini()
  love.graphics.setColor(255,255,255,255)
  love.graphics.draw(self.image, self.physicsBody:getX(), self.physicsBody:getY(), self.physicsBody:getAngle(), 1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end

--return true if mouse over entity
function entity:isHot(x,y)
    if x==nil or y==nil then
      return false
    end
    --transform world X to image X
    local imgX,imgY = (affine.translate(-self.physicsBody:getX(), -self.physicsBody:getY())*affine.rotate(self.physicsBody:getAngle())*affine.scale(1,1)*affine.translate(self.image:getWidth()/2, self.image:getHeight()/2))(x,y)
    imgX = math.ceil(0.5+imgX)
    imgY = math.ceil(0.5+imgY)
    ------------
    if imgX < 0 or imgX> self.image:getWidth()-1 or imgY<0 or imgY > self.image:getHeight()-1 then
      return false
    end
    
    local r, g, b, a = self.image:getData():getPixel(imgX,imgY)
    if a ~= 0 then
      return true
    end
  return false
end
