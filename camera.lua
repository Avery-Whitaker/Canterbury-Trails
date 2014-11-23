--[[
camera.lua
Camera

Adapted from: https://www.love2d.org/wiki/Tutorial:Cameras

--]]
camera = {}
camera._x = 0
camera._y = 0
camera.scaleX = 1
camera.scaleY = 1
camera.rotation = 0
camera.minZoom = 0.25
camera.maxZoom = 5

function camera:set()
  love.graphics.push()
  love.graphics.rotate(-self.rotation)
  love.graphics.scale(1 / self.scaleX, 1 / self.scaleY)
  love.graphics.translate(-self._x, -self._y)
end

--Translates a screen point to an aboslute point
function camera:screenToAbs(x,y)
  return (affine.translate(-self._x, -self._y)^-1 /affine.scale(1 / self.scaleX, 1 / self.scaleY)/affine.rotate(-self.rotation))(x,y)
end

--Translates a absolute point to screen point
function camera:absToScreen(x,y)
  return (affine.rotate(-self.rotation) * affine.scale(1 / self.scaleX, 1 / self.scaleY) * affine.translate(-self._x, -self._y))(x,y)
end

function camera:unset()
  love.graphics.pop()
end

function camera:move(dx, dy)
  self._x = self._x + (dx or 0)
  self._y = self._y + (dy or 0)
end

function camera:rotate(dr)
  x1,y1 = self:screenToAbs(love.mouse.getPosition())
  self.rotation = self.rotation + dr
  x2,y2 = self:screenToAbs(love.mouse.getPosition())
  
  self:move(x1-x2, y1-y2)
end

function camera:scale(sx, sy)
  sx = sx or 1
  self.scaleX = self.scaleX * sx
  self.scaleY = self.scaleY * (sy or sx)
end

function camera:zoom(x, y, z)
  if self.scaleX<self.minZoom and z>0 or 
    self.scaleX>self.maxZoom and z<0 then
    return
  end
  x1,y1 = camera:screenToAbs(x,y)
  
  self.scaleX = self.scaleX - z
  self.scaleY = self.scaleY - z
  
  x2,y2 = camera:screenToAbs(x,y)
   self._x  = self._x + (x1-x2)
   self._y  = self._y + (y1-y2)
end

function camera:setX(value)
  if self._bounds then
    self._x = math.clamp(value, self._bounds.x1, self._bounds.x2)
  else
    self._x = value
  end
end

camera.scrollSpeed = 20

function camera.update()

  if love.keyboard.isDown("left") then
    camera:scrollX(-camera.scrollSpeed)  
  elseif love.keyboard.isDown("right") then
    camera:scrollX(camera.scrollSpeed) 
  elseif love.keyboard.isDown ("down") then
    camera:scrollY(camera.scrollSpeed) 
  elseif love.keyboard.isDown("up") then
    camera:scrollY(-camera.scrollSpeed) 
  elseif love.keyboard.isDown("[") or love.keyboard.isDown("{") then
    camera:rotate(.1)
  elseif love.keyboard.isDown ("]") or love.keyboard.isDown("}") then
    camera:rotate(-.1)
  elseif love.keyboard.isDown ("+") or love.keyboard.isDown ("=") then
    camera:zoom(love.graphics:getWidth()/2,love.graphics:getHeight()/2,0.1)
  elseif love.keyboard.isDown ("-") or love.keyboard.isDown ("_") then
    camera:zoom(love.graphics:getWidth()/2,love.graphics:getHeight()/2,-0.1)
  elseif love.mouse.getX()>love.graphics.getWidth()-3 and love.mouse.isGrabbed( ) then
    camera:scrollX(camera.scrollSpeed) 
  elseif love.mouse.getX()<3 and love.mouse.isGrabbed( ) then
     camera:scrollX(-camera.scrollSpeed)
  end
  if love.mouse.getY()>love.graphics.getHeight()-3 and love.mouse.isGrabbed( ) then
    camera:scrollY(camera.scrollSpeed)  
  elseif love.mouse.getY()<3 and love.mouse.isGrabbed( ) then
  camera:scrollY(-camera.scrollSpeed)
  end
end

function camera:scrollY(v)
 self:setY(self._y+v*self.scaleY*math.cos(self.rotation))
 self:setX(self._x+v*self.scaleX*-math.sin(self.rotation))
end

function camera:scrollX(v)
  self:setY(self._y+v*self.scaleY*math.sin(self.rotation))
  self:setX(self._x+v*self.scaleX*math.cos(self.rotation))
end

function camera:setY(value)
  if self._bounds then
    self._y = math.clamp(value, self._bounds.y1, self._bounds.y2)
  else
    self._y = value
  end
end

function camera:setPosition(x, y)
  if x then self:setX(x) end
  if y then self:setY(y) end
end

function camera:setCenterPosition(x, y)
  if x then self:setX(x - (love.graphics.getWidth() * self.scaleX) / 2) end
  if y then self:setY(y - (love.graphics.getHeight() * self.scaleY) / 2) end
end

function camera:getWorldEdges()
  x1,y1 = self:screenToAbs(0,0)
  x2,y2 = self:screenToAbs(love.graphics:getWidth(),0)
  x3,y3 = self:screenToAbs(love.graphics:getWidth(),love.graphics:getHeight())
  x4,y4 = self:screenToAbs(0,love.graphics:getHeight())
  
  minx = x1
  if x2 < minx then minx = x2 end
  if x3 < minx then minx = x3 end
  if x4 < minx then minx = x4 end
  
  miny = y1
  if y2 < miny then miny = y2 end
  if y3 < miny then miny = y3 end
  if y4 < miny then miny = y4 end
    
  maxx = x1
  if x2 > maxx then maxx = x2 end
  if x3 > maxx then maxx = x3 end
  if x4 > maxx then maxx = x4 end
  
  maxy = y1
  if y2 > maxy then maxy = y2 end
  if y3 > maxy then maxy = y3 end
  if y4 > maxy then maxy = y4 end
  
  return minx, maxx,miny,maxy
end

function camera:getWorldCorners()
  x1,y1 = self:screenToAbs(0,0)
  x2,y2 = self:screenToAbs(love.graphics:getWidth(),0)
  x3,y3 = self:screenToAbs(love.graphics:getWidth(),love.graphics:getHeight())
  x4,y4 = self:screenToAbs(0,love.graphics:getHeight())
  
  return x1,y1,x2,y2,x3,y3,x4,y4
end

function camera:setScale(sx, sy)
  self.scaleX = sx or self.scaleX
  self.scaleY = sy or self.scaleY
end
