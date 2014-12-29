traveling = Polygamy.state( "Traveling" )

function traveling.before() 
      menu.setStage(nextStage)
  soundmanager:play(marching)
  shade = 0 
  backOff = 0
  for key,value in pairs(characters) do --actualcode
    value.angle = math.random()*0.26179938779-0.26179938779/2
    if math.floor(math.random()+0.5) == 1 then
      value.angleSpeed = math.random()*0.15+0.5
    else
      value.angleSpeed = -math.random()*0.15+0.5
    end
    value.height = 0.005-- math.random()*0.01
    if math.floor(math.random()+0.5) == 1 then
      value.heightSpeed = math.random()*0.01+0.05
    else
      value.heightSpeed = -math.random()*0.01+0.05
    end
    value.scale = 0.1
  end
end

function traveling.update(dt) 
  nNum = 0
  for key,value in pairs(characters) do --actualcode
    nNum = nNum + 1
  end
  for key,value in pairs(characters) do --actualcode
    if value.angle > 0.26179938779/2 then
      value.angleSpeed = - value.angleSpeed 
      value.angle = 0.26179938779/2
    end
    if value.angle < -0.26179938779/2 then
      value.angleSpeed = - value.angleSpeed 
      value.angle = -0.26179938779/2
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
  backOff = backOff+dt/6
  if backOff > 0.7 then
    shade = (backOff-0.7)*0.5*255*5
  end
  if shade > 255 then 
    if nextStage == nil then 
      Polygamy.state.goto("End")
    else
      Polygamy.state.goto("Map")
    end
  end
end

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

function traveling.after()
  if(stageMusic ~= nil ) then
  soundmanager:play(stageMusic) else
  soundmanager:play(town) end
   
end
