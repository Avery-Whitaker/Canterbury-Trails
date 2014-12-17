--{name, character, text, options = {{"string", functioN() 2 3...}, resault = {1 2, 3...} }
function newChatState(w)
  state = Polygamy.state(w.name)
  state.before = function()
  end

  state.update = function(dt)
    if(type(w.choices) == "table")
    then
      n = #w.choices
    else
      n = 0
    end
    panelTop = (0.6-(n*0.075))
    gui.Panel({text = w.character.name, align="left", pos = gui.screenPercent({0.1, panelTop}), size=gui.screenPercent({0.2, 0.05})})
    gui.Panel({text = w.text, pos = gui.screenPercent({0.1, panelTop+0.05}), size=gui.screenPercent({0.8, 0.3})})
    if n>0 then
      for key,value in pairs(w.choices) do
        if gui.Button{text = w.choices[key][1], pos=gui.screenPercent({0.1,(0.90-(3*n*0.025))+key*3*0.025}), size=gui.screenPercent({0.8,0.05}), widgetHit=nil, draw=nil} then 
          w.choices[key][2]()
        end
      end
    end
    gui.Image{ pos = {(gui.screenWidth()-(gui.imageSizeH(panelTop+0.35,w.character.image)[1]))/2, 0}, size= gui.imageSizeH(panelTop+0.35,w.character.image), image=w.character.image }
    gui.Image{ pos = gui.screenPercent({0,0}), size= gui.screenPercent({1,1}), image=backgroundIMG }
  end

  state.draw = function()
    gui.preDraw()
    gui.postDraw()
  end

  state.after = function()
  end

  return state
end
