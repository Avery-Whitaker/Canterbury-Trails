preistGame = Polygamy.state( "nunsPreist" )

spawns = {
{66.173611111111,339.0125},
{272.83888888889,75.336111111111},
{223.97222222222,345.12083333333},
{149.65416666667,583.34583333333},
{75.336111111111 ,670.89861111111},
{397.04166666667 , 581.30972222222},
{621.01388888889  ,  578.25555555556},
{628.14027777778  ,  415.36666666667},
{615.92361111111  ,  236.18888888889},
{398.05972222222  ,  236.18888888889},
{389.91527777778  ,  432.67361111111},
{511.06388888889  ,  77.372222222222},
{864.32916666667  ,  148.63611111111},
{964.09861111111  ,  69.227777777778},
{878.58194444444  ,  337.99444444444},
{772.70416666667  ,  266.73055555556},
{953.91805555556  ,  410.27638888889},
{955.95416666667  ,  410.27638888889},
{798.15555555556  ,  537.53333333333},
{945.77361111111  ,  669.88055555556}}

maze = love.graphics.newImage("assets/maze.png")
mazeMap = love.graphics.newImage("assets/mazeMAP.png")

function preistGame.before()

lose = false
gameScore = 0
love.mouse.setVisible( false )
n = math.floor(math.random()* 19)
love.mouse.setPosition(colToScreen(spawns[n][1],spawns[n][2]))
  Polygamy.keyboard.use( "Preist" )
end

 function screenToCol(x,y)
x1 = (x-gui.screenPercent({0.2,0})[1])* (maze:getHeight()/gui.screenHeight())
y1 = y* (maze:getHeight()/gui.screenHeight())
return x1,y1
end

 function colToScreen(x1,y1)
x = x1/(maze:getHeight()/gui.screenHeight())+gui.screenPercent({0.2,0})[1]
y = y1/(maze:getHeight()/gui.screenHeight())
return x,y
end

function preistGame.update(dt)

x, y = screenToCol(love.mouse.getPosition())
if( x > 0 and x < mazeMap:getWidth() and y > 0 and y < mazeMap:getHeight()) then
  r, g, b, a= mazeMap:getData():getPixel(x,y)
    if a > 123 then 
       lose = true
love.mouse.setVisible( true )
      gui.Label{text="HIT", pos = {0,0}, size = {100,100}} else 
      gui.Label{text="SAFE", pos = {0,0}, size = {100,100}} 
      end
  else 
    gui.Label{text="OUT", pos = {0,0}, size = {100,100}}
    --outside of image
  end
  
  if love.mouse.isDown("l") then print(x,y) end
  
end

function preistGame.after()
love.mouse.setVisible( true )
end

Polygamy.keyboard( "Preist" ):setConfig( "pressed", {
  ["right"] = function()  end,
  ["left"]     = function()  end 
})


function preistGame.draw()
gui.preDraw()

  if lose == true then
  

--   gui.Panel{ pos = gui.screenPercent({0.4,0.2}), size= gui.screenPercent({0.4,0.2}), text = "YOU LOSE Score: " .. math.floor(gameScore) }
  end
  
  
   if lose == false then
   gui.Panel{ pos = gui.screenPercent({0,0}), size= gui.screenPercent({0.2,0.05}), text = "Score: " .. math.floor(gameScore) }
  else
    gui.Panel{text = "GAME OVER", pos = gui.screenPercent({0.4,0.2}), size=gui.screenPercent({0.4,0.2})}
    if gui.Button{text = "Continue", pos=gui.screenPercent({0.4,0.6}), size=gui.screenPercent({0.2,0.5/4}),}
    then Polygamy.state.goto("Welcome Screen") end
     gui.Panel{ pos = gui.screenPercent({0.2,0.4}), size= gui.screenPercent({0.2,0.05}), text = "Score: " .. math.floor(gameScore) }
  end
  
if lose == false then
  love.graphics.setColor(255,255,255)
  love.graphics.draw( maze, gui.screenPercent({0.2,0})[1], 0,0,  gui.screenHeight()/maze:getHeight(),gui.screenHeight()/maze:getHeight()) --gui.screenPercent({0.2,0})[2], 0, 1, 1, 1, 1, 0, 0 )


  love.graphics.setColor(0,0,0)  
  love.graphics.circle( "fill", love.mouse.getX(), love.mouse.getY(), 5, 20 )
end

gui.postDraw()
    
end