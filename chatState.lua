--{name, character, text, options = {{"string", functioN() 2 3...}, resault = {1 2, 3...} }

function newChatState(w)

state = Polygamy.state(w.name)

state.before = function()
	Polygamy.keyboard.use("Chat State"); 
end


state.update = function(dt)
if(type(w.choices) == "table")
then
n = #w.choices
else
n = 0
end

panelTop = (0.75-(n*0.075))
	gui.Panel({text = "Miller", align="left", pos = gui.screenPercent({0.1, panelTop}), size=gui.screenPercent({0.2, 0.05})})

gui.Panel({text = "Text text text text text text. Text text text text text text. Text text text text text text. Text text text text text text. Text text text text text text. Text text text text text text. Text text text text text text. Text text text text text text. Text text text text text text?", pos = gui.screenPercent({0.1, panelTop+0.05}), size=gui.screenPercent({0.8, 0.15})})

if n>0 then
for key,value in pairs(w.choices) do
	if gui.Button{text = w.choices[key][1], pos=gui.screenPercent({0.1,(0.90-(3*n*0.025))+key*3*0.025}), size=gui.screenPercent({0.8,0.05}), widgetHit=nil, draw=nil}
	 then w.choices[key][2]() end
end end

	gui.Image{ pos = gui.screenPercent({0.5 - (panelTop-0.1)/2,0.05}), size= gui.screenPercent({panelTop-0.1,panelTop-0.1}), image=testIMG }
end

state.draw = function()
	gui.preDraw()

	gui.postDraw()
end

Polygamy.keyboard( "Chat State" ):setConfig( "pressed", {
	[Polygamy.default] = print
})

state.after = function()

end

return state
end
