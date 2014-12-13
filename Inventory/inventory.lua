
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Inventory" )

function welcome.before() pkeyboard.use( "Inventory" ); end
function welcome.update(dt) 
if gui.Image{ pos = gui.screenPercent({0,0}), size= gui.screenPercent({1,1}), image=inventoryIMG } then
print("why hello there")
end

	
	if gui.Image{ pos = gui.screenPercent({0.15,0.25}), size= gui.screenPercent({.1,.1}), image=boxIMG } then
print("yes hello there")
end

 end
function welcome.draw()
	gui.preDraw()


	gui.postDraw() 
end

pkeyboard( "Inventory" ):setConfig( "pressed", {
	[{" ", "return"}] = function() goto("Menu")       end,
	escape            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})


function welcome.after() end

