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

function gui.screenPercent(a)
	a[1] = a[1]*gui.screenWidth()
	a[2] = a[2]*gui.screenHeight()
	return a
end

function gui.preDraw()
	love.graphics.push()
	love.graphics.translate((love.graphics.getWidth()-gui.screenWidth())/2,(love.graphics.getHeight()-gui.screenHeight())/2);
end

function gui.postDraw()
	gui.core.draw()
	love.graphics.pop()
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), (love.graphics.getHeight()-gui.screenHeight())/2)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight(), love.graphics.getWidth(), (love.graphics.getHeight()-gui.screenHeight())/-2 )
	love.graphics.rectangle("fill", 0, 0, (love.graphics.getWidth()-gui.screenWidth())/2, love.graphics.getHeight())
	love.graphics.rectangle("fill", love.graphics.getWidth(), 0, (love.graphics.getWidth()-gui.screenWidth())/-2, love.graphics.getHeight())
end

-------------------------------------------------------------------------------
test = Polygamy.state( "Test Screen" )
function test.before()
	Polygamy.keyboard.use( "test" )
end

function test.draw()
	love.graphics.print("\n1. Welcome Screen\n2. Character Select\n3. Options\n4. Credits\n5. Menu\n6. Conversation\nFor Each Minigame\n\t-Story Intro\n\t-Story Minigame\n\t-Story Outtro\n\n\nQ. Quit", 10, 10)
end

Polygamy.keyboard( "test" ):setConfig( "pressed", {
	["1"] = function() Polygamy.state.goto("Welcome Screen")       end,
	["2"] = function() Polygamy.state.goto("Character Select")       end,
	["3"] = function() Polygamy.state.goto("Options")       end,
	["4"] = function() Polygamy.state.goto("Credits")       end,
	["5"] = function() Polygamy.state.goto("Menu")       end,
	["6"] = function() Polygamy.state.goto("Conversation")       end,
	["q"]            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})

require "Welcome Screen/welcome"
require "Character Select/select"
require "Options/options"
require "Credits/credits"
require "Menu/menu"
require "Conversation/conversation"

function love.load() 

	--images
	background = love.graphics.newImage("assets/trail.JPG")

	-- preload fonts
	fonts = {
		[12] = love.graphics.newFont(12),
		[20] = love.graphics.newFont(20),
	}
	love.graphics.setBackgroundColor(17,17,17)
	love.graphics.setFont(fonts[12])

	Polygamy.state.goto("Test Screen") 
end

function love.textinput(str)
	gui.keyboard.textinput(str)
end
