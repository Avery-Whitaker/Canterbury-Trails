--{name, character, text, options = {{"string", functioN() 2 3...}, resault = {1 2, 3...} }

function newItemState(w)

state = Polygamy.state(w.name)

state.before = function()
  Polygamy.keyboard.use("Item State"); 
end

state.update = function(dt)
   gui.Image{ pos = gui.screenPercent({0.15, 0.2}), size= gui.imageSize(0.3, w.imageAvalible), image=w.imageAvalible }

   gui.Label({text = w.name, align="middle", pos = gui.screenPercent({0.5,0.1}), size=gui.screenPercent({0.25,0.1})})
   
   gui.Panel({text = w.description, align="middle", pos = gui.screenPercent({0.1,0.7}), size=gui.screenPercent({0.4,0.2})})
 n = 0
for key,value in pairs(w.actions) do
  
  if gui.Button{text = key, pos=gui.screenPercent({0.6,0.75-n*0.1}), size=gui.screenPercent({0.3,0.05}), widgetHit=nil, draw=nil}
   then value() end
n = n+1

end 

 if gui.Button{text = "bacK", pos=gui.screenPercent({0.6,0.9}), size=gui.screenPercent({0.3,0.05}), widgetHit=nil, draw=nil}
   then Polygamy.state.goto("Inventory") end


end

state.draw = function()

  gui.preDraw()


  gui.postDraw() 
end

Polygamy.keyboard( "Item State" ):setConfig( "pressed", {
  [Polygamy.default] = print
})

state.after = function()

end

return state
end
