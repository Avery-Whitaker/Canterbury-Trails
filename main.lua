require "library.Polygamy.init" "./library/Polygamy/"
gui = require "quickie"

math.randomseed(os.time())

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

Polygamy.keyboard( "" ):setConfig( "pressed", {
})

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
require "Inventory/inventory"
require "Inventory/itemState"
require "miller"
require "menu"
require "intentory"
require "traveling"
require "begin"
require "instructions"
require "preist"
require "wifeBath"
require "knight"

require "math"
require "text"


backgroundIMG = love.graphics.newImage("assets/trailBackground.png")
scoreIMG = love.graphics.newImage("assets/scores.png")
selectIMG = love.graphics.newImage("assets/select.png")
optionsIMG = love.graphics.newImage("assets/options.png")
crewIMG = love.graphics.newImage("assets/crew.png")
inventoryIMG = love.graphics.newImage("assets/inventory.png")
boxIMG = love.graphics.newImage("assets/box.png")
testIMG = love.graphics.newImage("assets/chartest.JPG")

gui.preloadFont("assets/GoodDog.otf")
gui.preloadFont("assets/LobsterTwo-Regular.otf")
gui.preloadFont("assets/oldenglishregular.ttf")
gui.preloadFont("assets/ThrowMyHandsUpintheAirBold.ttf")
mapIMG = love.graphics.newImage("assets/trail.JPG")

mapIMG = love.graphics.newImage("assets/trail.JPG")
  
beginLogo = love.graphics.newImage("assets/splashLogo.png")
  
function love.load()
  Polygamy.state.goto("Splash Screen")
end

function love.textinput(str)
	gui.keyboard.textinput(str)
end
