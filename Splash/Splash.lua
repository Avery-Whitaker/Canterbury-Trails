splash = Polygamy.state( "Splash Screen" )

function splash.before() 
	Polygamy.keyboard.use( "Splash Screen" ); 
end

intro = {logo = love.graphics.newImage("assets/splashLogo.png"),
		r = 0,
		scalex = 0.75,
		scaley = 0.75,
	}
loveFont = love.graphics.newFont("assets/ThrowMyHandsUpintheAirBold.ttf", 30)
love.graphics.setFont(loveFont)
intro.logox = intro.logo:getWidth()
intro.logoy = intro.logo:getHeight()
intro.cColor = {0,0,0,255}
intro.tColor = {131,192,240,0}
intro.lColor = {255,255,255,255}
time = 0
function splash.update(dt) 
	intro.sizex = intro.logox * intro.scalex
	intro.sizey = intro.logoy * intro.scaley
	intro.x = (love.graphics.getWidth()/2) - (intro.sizex/2)
	intro.y = (love.graphics.getHeight()/2) - (intro.sizey/2)
	intro.cx = love.graphics.getWidth()/2
	intro.cy = love.graphics.getHeight()/2
	if time > 70 and time <= 120 then
		intro.cColor[1] = intro.cColor[1] + (1 * 255/51)
		intro.cColor[2] = intro.cColor[2] + (1 * 255/51)
		intro.cColor[3] = intro.cColor[3] + (1 * 255/51)
	elseif time > 150 and time < 250 then
		intro.cColor[4] = intro.cColor[4] - (1 * 256/99) 
	elseif time > 300 and time < 400 then
		intro.tColor[4] = intro.tColor[4] + (1 * 255/100)
	elseif time > 800 and time < 1000 then
		intro.lColor[4] = intro.lColor[4] - (1 * 255/200)
		intro.tColor[4] = intro.tColor[4] - (1 * 255/201)
	elseif time > 1100 then
		Polygamy.state.goto("Welcome Screen")
	end
	time = time + 1
	delta = dt
end

function splash.draw()
	love.graphics.setColor(intro.lColor)
	love.graphics.draw(intro.logo, intro.x, intro.y, 0, intro.scalex, intro.scaley, 0,0)
	love.graphics.setColor(intro.cColor)
	love.graphics.circle("fill", intro.cx-2, intro.cy-2, (intro.sizex/2)+5, 100)
	love.graphics.setColor(intro.tColor)
	love.graphics.printf( "Brought to you by the Humanities", (love.graphics.getWidth()/2) - (intro.sizex - 50), (love.graphics.getHeight()/2) + (intro.sizey/2), 600, "center", 0, 1, 1, 0, 0, 0, 0 )
	love.graphics.setColor(255,255,255,255)
end


Polygamy.keyboard( "Splash Screen" ):setConfig( "pressed", {
	escape            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})

function splash.after() 
end
