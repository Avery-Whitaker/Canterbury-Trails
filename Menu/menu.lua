
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Menu" )

avalibleCharacters = {}
avalibleCharacters[1] = characters.host
avalibleCharacters[2] = characters.reeve
avalibleCharacters[3] = characters.knight
avalibleCharacters[4] = characters.squire

function welcome.before() pkeyboard.use( "Menu" ); print"menu" end

function welcome.update(dt) 

n = 1
nMax = #avalibleCharacters
for key,value in pairs(avalibleCharacters) do --actualcode
    
      
  gui.Button{text= "Talk to " .. value.name, pos = gui.screenPercent({0.3+(n-1)*(0.7/nMax)+0.025, 0.8}), size= gui.screenPercent({0.7/nMax - 0.05,0.1}), image=value.image }
     gui.Image{ pos = gui.screenPercent({0.3+(n-1)*(0.7/nMax) + 0.025, 0}), size= gui.imageSize(0.7/nMax - 0.05,value.image), image=value.image }


 gui.Label{text= "Score: 10923", pos = gui.screenPercent({0.05, 0}), size= gui.screenPercent({0.2,0.2})}
  if gui.Button{text= "Look at Map", pos = gui.screenPercent({0.05, 0.25}), size= gui.screenPercent({0.2,0.2})} then
  Polygamy.state.goto("Map") 
  end
  if gui.Button{text= "Check Bag", pos = gui.screenPercent({0.05, 0.50}), size= gui.screenPercent({0.2,0.2})} then
  Polygamy.state.goto("Inventory") 
  end
   
   gui.Button{text= "Continue Journy", pos = gui.screenPercent({0.05, 0.75}), size= gui.screenPercent({0.2,0.2})}
 
    
    n = n + 1
end
  gui.Panel({text = "", align="left", pos = gui.screenPercent({0, 0}), size=gui.screenPercent({0.3, 1})})

end

function welcome.draw()  
  gui.preDraw()
  gui.postDraw()
 end

pkeyboard( "Menu" ):setConfig( "pressed", {
	[{" ", "return"}] = function() goto("Menu")       end,
	escape            = function() love.event.push('quit') end,
	[Polygamy.default] = print
})


function welcome.after() print"TEST" love.graphics.print("WHAT", 30, 10) love.timer.sleep(3) end

