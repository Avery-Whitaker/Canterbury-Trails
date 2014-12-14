
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Inventory" )

function welcome.before() pkeyboard.use( "Inventory" ); end
function welcome.update(dt) 


	for key,value in pairs(inventory) do --actualcode
	if value.count > 0 then
    if gui.Image{ pos = gui.screenPercent({-1/7+value.col*2/7,-1/5+value.row*2/5}), size= gui.screenPercent({1/7,1/5}), image=value.imageAvalible } then
    Polygamy.state.goto(value.name) 
    end
  else
    if gui.Image{ pos = gui.screenPercent({-1/7+value.col*2/7,-1/5+value.row*2/5}), size= gui.screenPercent({1/7,1/5}), image=value.imageUnavalible } then
    
    end
  end
    gui.Label({text = value.name, align="middle", pos = gui.screenPercent({-1/7+value.col*2/7,-1/5+value.row*2/5-1/10}), size=gui.screenPercent({1/7,1/20})})
    gui.Label({text = "Count: " .. value.count, align="middle", pos = gui.screenPercent({-1/7+value.col*2/7,-1/5+value.row*2/5-1/20}), size=gui.screenPercent({1/7,1/20})})
  gui.Panel({text = "", align="middle", pos = gui.screenPercent({-1/7+value.col*2/7,-1/5+value.row*2/5}), size=gui.screenPercent({1/7,1/5})})
  
end
    gui.Label({text = "Click on item for more info", align="middle", pos = gui.screenPercent({0.25,0.9}), size=gui.screenPercent({0.5,0.1})})
   gui.Label({text = "Inventory", align="center", pos = gui.screenPercent({0.25,0}), size=gui.screenPercent({0.5,0.05})})
 
  if gui.Button{text = "Back", pos=gui.screenPercent({0,1-0.5/4}), size=gui.screenPercent({0.5/5,0.5/4})}
 then Polygamy.state.goto("Menu") end
 
--if gui.Image{ pos = gui.screenPercent({0,0}), size= gui.screenPercent({1,1}), image=inventoryIMG } then end

--[[	if gui.Image{ pos = gui.screenPercent({0.15,0.25}), size= gui.screenPercent({.1,.1}), image=boxIMG } then
print("yes hello there")
end--]]

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

