
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience


  travelIMG = love.graphics.newImage("assets/trailBackgroundLong.png")
  
traveling = state( "Traveling" )

for key,value in pairs(characters) do --actualcode
  value.angle = math.random()*0.26179938779*2-0.26179938779
  if math.floor(math.random()+0.5) == 1 then
    value.angleSpeed = math.random()*0.5+0.5
  else
    value.angleSpeed = -math.random()*0.5+0.5
  end
  
  value.height = math.random()*0.01
  if math.floor(math.random()+0.5) == 1 then
    value.heightSpeed = math.random()*0.01
  else
    value.heightSpeed = -math.random()*0.01
  end
  value.scale = 0.1
  
end

function traveling.before() 

pkeyboard.use( "Traveling" )
shade = 0 

backOff = 0
end

function traveling.update(dt) 

nNum = 0
  for key,value in pairs(characters) do --actualcode
  nNum = nNum + 1
  end
  
  
  for key,value in pairs(characters) do --actualcode
    if value.angle > 0.26179938779 then
     value.angleSpeed = - value.angleSpeed 
     value.angle = 0.26179938779
     
     end
    if value.angle < -0.26179938779 then
     value.angleSpeed = - value.angleSpeed 
     value.angle = -0.26179938779
     end
    value.angle = value.angle + value.angleSpeed*dt
  end

  for key,value in pairs(characters) do --actualcode
    if value.height > 0.01 then
     value.heightSpeed = - value.heightSpeed 
     value.height = 0.01
     
     end
    if value.height < -0.01 then
     value.heightSpeed = - value.heightSpeed 
     value.height = -0.01
     end
    value.height = value.angle + value.angleSpeed*dt
  end

 --gui.Image{ pos = {(gui.screenWidth()-(gui.imageSizeH(1,travelIMG)[1]))/2, 0}, size= gui.imageSizeH(1,travelIMG), image=travelIMG }

  backOff = backOff+dt/6
  
  if backOff > 0.7 then
  shade = (backOff-0.7)*0.5*255*5
  end
  
  if shade > 255 then 
  if nextStage == nil then Polygamy.state.goto("End")
  else
 menu.setStage(nextStage)
  Polygamy.state.goto("Map")
  end
  end

end
  
 -- if gui.Button{text = "Back", pos=gui.screenPercent({0,1-0.5/4}), size=gui.screenPercent({0.5/5,0.5/4})}
-- then Polygamy.state.goto("Menu") end

 
function traveling.draw()
  gui.preDraw()

 love.graphics.draw(travelIMG,gui.screenPercentX(-backOff),0, 0,gui.screenHeight()/travelIMG:getHeight(), gui.screenHeight()/travelIMG:getHeight())

n = 0
  for key,value in pairs(characters) do --actualcode
 love.graphics.draw(value.image, gui.screenPercentX(n/nNum), gui.screenPercentY(0.85), value.angle, gui.screenHeight()/value.image:getHeight()*0.2, gui.screenHeight()/value.image:getHeight()*0.2, 0, gui.screenPercentY(value.height))
  n = n + 1
 end
 
 love.graphics.setColor(0,0,0,shade)
 love.graphics.rectangle("fill",0,0,gui.screenWidth(),gui.screenHeight())
 
  gui.postDraw() 
end

pkeyboard( "Traveling" ):setConfig( "pressed", {
  [{" ", "return"}] = function() backOff=0.7       end,
  escape            = function() love.event.push('quit') end,
  [Polygamy.default] = print
})


function traveling.after() end

