require "library.Polygamy.init" "./library/Polygamy/"
gui = require "quickie"



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
	love.graphics.push()
	love.graphics.translate(gui.xModification(),gui.yModification());
end

function gui.postDraw()
	gui.core.draw()
	love.graphics.pop()
	love.graphics.setColor(122,122,122,255)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), gui.yModification())
	love.graphics.rectangle("fill", 0, love.graphics.getHeight(), love.graphics.getWidth(),  -1*gui.yModification())
	love.graphics.rectangle("fill", 0, 0, gui.xModification(), love.graphics.getHeight())
	love.graphics.rectangle("fill", love.graphics.getWidth()-gui.xModification(), 0, gui.xModification(), love.graphics.getHeight())
end

-------------------------------------------------------------------------------
test = Polygamy.state( "Test Screen" )
function test.before()
	Polygamy.keyboard.use( "test" )
end

function test.draw()
	love.graphics.print("\n1. Welcome Screen\n2. Character Select\n3. Options\n4. Credits\n5. Menu\n6. Conversation\n7. Scores\nFor Each Minigame\n\t-Story Intro\n\t-Story Minigame\n\t-Story Outtro\n\n\nQ. Quit", 10, 10, 0 , 0.2, 0.2)
end

Polygamy.keyboard( "test" ):setConfig( "pressed", {
	["0"] = function() Polygamy.state.goto("Splash Screen")       end,
	["1"] = function() Polygamy.state.goto("Welcome Screen")       end,
	["2"] = function() Polygamy.state.goto("Character Select")       end,
	["3"] = function() Polygamy.state.goto("Options")       end,
	["4"] = function() Polygamy.state.goto("Credits")       end,
	["5"] = function() Polygamy.state.goto("Menu")       end,
	["6"] = function() Polygamy.state.goto("Traveling")       end,
	["8"] = function() Polygamy.state.goto("Miller")       end,
	["9"] = function() Polygamy.state.goto("Knight")       end,
	["7"] = function() Polygamy.state.goto("Scores")       end,
	["q"]            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})

require "chatState"
require "character"
require "gameFlow"
require "Welcome Screen/welcome"
require "map"
require "Character Select/select"
require "Options/options"
require "Credits/credits"
require "Scores/scores"
require "Splash/Splash"
require "Inventory/inventory"
require "Inventory/itemState"
require "Miller/miller"
require "Menu/menu"
require "intentory"
require "traveling"
require "begin"
require "instructions"
--require "Knight/knight"

require "math"
require "text"

function love.load() 

	--images
	backgroundIMG = love.graphics.newImage("assets/trail.JPG")
	scoreIMG = love.graphics.newImage("assets/scores.png")
	selectIMG = love.graphics.newImage("assets/select.png")
	optionsIMG = love.graphics.newImage("assets/options.png")
	crewIMG = love.graphics.newImage("assets/crew.png")
	inventoryIMG = love.graphics.newImage("assets/inventory.png")
	boxIMG = love.graphics.newImage("assets/box.png")
	testIMG = love.graphics.newImage("assets/chartest.JPG")
	gui.preloadFonts()


	newChatState({ name = "MillerMain", character = characters.miller, text = "Yar har im the Miller", choices = {
{"This is the first choice.", function() 
	Polygamy.state.goto("Test Screen") end},
{"This is the second choice.", function() 
	Polygamy.state.goto("Test Screen") end},
{"This is the third choice.", function() 
	Polygamy.state.goto("Test Screen") end},
{"This is the fourth choice.", function() 
	Polygamy.state.goto("Test Screen") end},
{"This is the last choice.", function() 
	Polygamy.state.goto("Test Screen") end}
}})
newChatState({ name = "NoOptions", character = characters.miller, text = "Yar har im the Miller", choices = {{ "..." , function() print("yo") end}}})


Polygamy.state.goto("Test Screen")
end

function love.textinput(str)
	gui.keyboard.textinput(str)
end
