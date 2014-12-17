
welcome = Polygamy.state( "Options" )

function welcome.before()  end
fullCheck = false

sliderData = {value = 1, min = 0, max = 1, step = 1/20}

function welcome.update(dt)  

	--gui.Label{text = "Ye' Old Options", align="center", pos = gui.screenPercent({0.25,0.1}), size=gui.screenPercent({0.5,0.3}) }

-- {checked = status, text = "", algin = "left", pos = {x, y}, size={w, h}, widgetHit=widgetHit, draw=draw}
if gui.Checkbox{checked= fullCheck, nil, "CENTER", pos=gui.screenPercent({0.40,0.4}), size=gui.screenPercent({0.1,0.1})} then
fullCheck = not fullCheck
love.window.setFullscreen(fullCheck)
end
	gui.Label{text = "Fullscreen", align="left", pos = gui.screenPercent({0.25,0.4}), size=gui.screenPercent({0.15,0.1}) }
	gui.Label{text = "Volume", align="left", pos = gui.screenPercent({0.25,0.5}), size=gui.screenPercent({0.15,0.1}) }

	if gui.Slider{info = sliderData, vertical=false, pos = gui.screenPercent({0.40,0.5}), size=gui.screenPercent({0.3,0.1})} 
then love.audio.setVolume(sliderData.value) end


	
	if gui.Button{text = "Back", pos=gui.screenPercent({0.25+0.5/5*2,0.5+(0.5/4)*2}), size=gui.screenPercent({0.5/5,0.5/4}),}
 then Polygamy.state.goto("Welcome Screen") end

	gui.Image{ pos = {0,0}, size= gui.screenPercent({1,1}), image=optionsIMG }
end

function welcome.draw() 
	gui.preDraw()


	gui.postDraw()
end


function welcome.after() 

end

