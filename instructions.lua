local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

instructState = Polygamy.state( "MillerInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Miller Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "Use the arrow keys to move the carpenter left and right. Keep the men from reaching your wife by blocking them. Pick up your wife's hearts for bonus points.", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if gui.Button{text = "Play", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("Miller") 
   end
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

function instructState.after() end



instructState = Polygamy.state( "KinghtInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Knight Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "TODO WRITE THIS", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if gui.Button{text = "Play", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("Knight") 
   end
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

function instructState.after() end



instructState = Polygamy.state( "WifeOfBathInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Wife of Bath Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "TODO WRITE THIS", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if gui.Button{text = "Play", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("WifeOfBath") 
   end
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

function instructState.after() end



instructState = Polygamy.state( "PreistInstructions" )
function instructState.before() end
function instructState.update(dt) 
 gui.Label{text = "Nun's Priest Minigame", align = "center", pos = gui.screenPercent({0.1,0.05}), size = gui.screenPercent({0.8,0.2})}
 gui.Panel{text = "TODO WRITE THIS", align = "center", pos = gui.screenPercent({0.1,0.4}), size = gui.screenPercent({0.8,0.4})}
  if gui.Button{text = "Play", pos=gui.screenPercent({0.1,(0.90-(3*1*0.025))+1*3*0.025}), size=gui.screenPercent({0.8,0.05})} then
   Polygamy.state.goto("NunPreist") 
   end
 end
function instructState.draw()
  gui.preDraw()
  gui.postDraw() 
end

function instructState.after() end


