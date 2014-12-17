require "library.Polygamy.init" "./library/Polygamy/"
gui = require "quickie"
require "soundmanager"
require "end"
require "chatState"
require "character"
require "gameFlow"
require "welcome"
require "map"
require "select"
require "options"
require "credits"
require "scores"
require "Splash"
require "miller"
require "menu"
require "traveling"
require "begin"
require "instructions"
require "preist"
require "wifeBath"
require "knight"
require "math"
require "text"

function gui.screenWidth()
	if(love.graphics.getWidth()/love.graphics.getHeight() < 16/9) then
		return love.graphics.getWidth()
  end
	return (love.graphics.getHeight()*16)/9
end

function gui.screenHeight()
	if(love.graphics.getHeight()/love.graphics.getWidth() < 9/16) then
		return love.graphics.getHeight()
  end
	return (love.graphics.getWidth()*9)/16
end

function gui.xModification()
	return (love.graphics.getWidth()-gui.screenWidth())/2
end

function gui.yModification()
	return (love.graphics.getHeight()-gui.screenHeight())/2
end

function gui.imageSize(screenPercentWidth, img)
  w = gui.screenWidth()*screenPercentWidth
  h = w/img:getWidth() * img:getHeight()
  return {w,h}
end

function gui.imageSizeH(screenPercentHeight, img)
  h = gui.screenHeight()*screenPercentHeight
  w = h/img:getHeight() * img:getWidth()
  return {w,h}
end

function gui.screenPercent(a)
	a[1] = a[1]*gui.screenWidth()
	a[2] = a[2]*gui.screenHeight()
	return a
end

function gui.screenPercentX(a)
	return a*gui.screenWidth()
end

function gui.screenPercentY(a)
	return a*gui.screenHeight()
end

function gui.preDraw()
  soundmanager:update()
  love.graphics.setColor(255,255,255,255)
	love.graphics.push()
	love.graphics.translate(gui.xModification(),gui.yModification());
end

function gui.postDraw()
	gui.core.draw()
	love.graphics.pop()
	love.graphics.setColor(122,122,180,255)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), gui.yModification())
	love.graphics.rectangle("fill", 0, love.graphics.getHeight(), love.graphics.getWidth(),  -1*gui.yModification())
	love.graphics.rectangle("fill", 0, 0, gui.xModification(), love.graphics.getHeight())
	love.graphics.rectangle("fill", love.graphics.getWidth()-gui.xModification(), 0, gui.xModification(), love.graphics.getHeight())
end

function love.load()
  Polygamy.keyboard( "" )
  math.randomseed(os.time())
  beginLogo = love.graphics.newImage("assets/splashLogo.png")
  Polygamy.state.goto("Splash Screen")
  backgroundIMG = love.graphics.newImage("assets/trailBackground.png")
  scoreIMG = love.graphics.newImage("assets/scores.png")
  selectIMG = love.graphics.newImage("assets/select.png")
  optionsIMG = love.graphics.newImage("assets/options.png")
  crewIMG = love.graphics.newImage("assets/crew.png")
  inventoryIMG = love.graphics.newImage("assets/inventory.png")
  boxIMG = love.graphics.newImage("assets/box.png")
  testIMG = love.graphics.newImage("assets/chartest.JPG")
  travelIMG = love.graphics.newImage("assets/trailBackgroundLong.png")
  gui.preloadFont("assets/GoodDog.otf")
  gui.preloadFont("assets/LobsterTwo-Regular.otf")
  gui.preloadFont("assets/oldenglishregular.ttf")
  gui.preloadFont("assets/ThrowMyHandsUpintheAirBold.ttf")
  mapIMG = love.graphics.newImage("assets/trail.JPG")
  mapIMG = love.graphics.newImage("assets/trail.JPG")
  wifeBathGameIMG = love.graphics.newImage("assets/wifeMiniImage.png")
  manIMG = love.graphics.newImage("assets/enemy2.png")
  evilAIMG = love.graphics.newImage("assets/defender.png")
  evilBIMG = love.graphics.newImage("assets/enemy1.png")
  powIMG = love.graphics.newImage("assets/POW.png")
  millerBackIMG = love.graphics.newImage("assets/millerBack.png")
  womanIMG = love.graphics.newImage("assets/lady.png")
  heartIMG = love.graphics.newImage("assets/heart.png")
  heartBadIMG = love.graphics.newImage("assets/heartBad.png")
  canterburyIMG = love.graphics.newImage("assets/cathedral.png")
  maze = love.graphics.newImage("assets/maze.png")
  mazeMap = love.graphics.newImage("assets/mazeMAP.png")
  foxUp = love.graphics.newImage("assets/foxUp.png")
  foxDown = love.graphics.newImage("assets/foxDown.png")
  foxRight = love.graphics.newImage("assets/foxRight.png")
  foxLeft = love.graphics.newImage("assets/foxLeft.png")
  rooster = love.graphics.newImage("assets/chicken.png")
  bonusIMG = love.graphics.newImage("assets/egg.png")
  stages[1].bckImg = love.graphics.newImage("assets/trailBackground.png")
  stages[2].bckImg = love.graphics.newImage("assets/village.png")
  stages[3].bckImg = love.graphics.newImage("assets/trailBackground.png")
  stages[4].bckImg = love.graphics.newImage("assets/village.png")
  stages[5].bckImg = love.graphics.newImage("assets/trailBackground.png")
  stages[6].bckImg = love.graphics.newImage("assets/village.png")
  stages[7].bckImg = love.graphics.newImage("assets/trailBackground.png")
  stages[1].mapImg = love.graphics.newImage("assets/map1.png")
  stages[2].mapImg = love.graphics.newImage("assets/map2.png")
  stages[3].mapImg = love.graphics.newImage("assets/map3.png")
  stages[4].mapImg = love.graphics.newImage("assets/map4.png")
  stages[5].mapImg = love.graphics.newImage("assets/map5.png")
  stages[6].mapImg = love.graphics.newImage("assets/map6.png")
  stages[7].mapImg = love.graphics.newImage("assets/map7.png")
  millerGameMusic = love.audio.newSource("assets/millerGame.mp3", "static")
  knightGameMusic = love.audio.newSource("assets/knightGame.mp3", "static")
  mainMenu = love.audio.newSource("assets/menuMusic.mp3", "static")
  wifeOfBathGameMusic = love.audio.newSource("assets/wifeOfBathGame.mp3", "static")
  priestMusic = love.audio.newSource("assets/nunsPriestGame.mp3", "static")
  town= love.audio.newSource("assets/in a small town.mp3", "static")
  road = love.audio.newSource("assets/OnTheRoadMusic.mp3", "static")
  marching = love.audio.newSource("assets/marching.mp3", "static")
end

function love.textinput(str)
	gui.keyboard.textinput(str)
end
