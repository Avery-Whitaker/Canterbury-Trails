welcome = Polygamy.state( "Credits" )

function welcome.before() 
  h = 1 
end
  
function welcome.update(dt)  
  h = h- dt*0.1 
  if h < -3.5 then
    Polygamy.state.goto("Splash Screen") 
  end
end

function welcome.draw()  
	gui.preDraw()
	gui.Label{text = "Canterbury Trails", align="center", pos = gui.screenPercent({0,h}), size=gui.screenPercent({1,0.1}) }
	gui.Label{text = "Avery Whitaker - Executive Software Producer", align="center", pos = gui.screenPercent({0,h+0.2}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Emily Newman - Executive Writer and Occasional Codemonkey", align="center", pos = gui.screenPercent({0,h+0.3}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Ada Seger-Brown - Executive Artist", align="center", pos = gui.screenPercent({0,h+0.4}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Ms. Vail - Commissioner and Bestower of A+s", align="center", pos = gui.screenPercent({0,h+0.5}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Geoffrey Chaucer - Chief Author", align="center", pos = gui.screenPercent({0,h+0.6}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Music", align="center", pos = gui.screenPercent({0,h+0.8}), size=gui.screenPercent({1,0.1}) }
	gui.Label{text = "Oizen by Barbarian Pipe Band ", align="center", pos = gui.screenPercent({0,h+0.9}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Mitdans by Barbarian Pipe Band", align="center", pos = gui.screenPercent({0,h+1.0}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Der Trollentanz by Castle Dreams", align="center", pos = gui.screenPercent({0,h+1.1}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Anon by Firesea ", align="center", pos = gui.screenPercent({0,h+1.2}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Gweharall by Mervent", align="center", pos = gui.screenPercent({0,h+1.3}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Cantec din vremea ciumei by Miezul Noptii", align="center", pos = gui.screenPercent({0,h+1.4}), size=gui.screenPercent({1,0.05}) } 
	gui.Label{text = "Cetatea de Colt by Miezul Noptii", align="center", pos = gui.screenPercent({0,h+1.5}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Impromptus II by Miezul Noptii", align="center", pos = gui.screenPercent({0,h+1.6}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Maravillos et piadosos by Trouvere", align="center", pos = gui.screenPercent({0,h+1.7}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Rokatanc by Vox Vulgaris", align="center", pos = gui.screenPercent({0,h+1.8}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Made with LÖVE", align="center", pos = gui.screenPercent({0,h+2.0}), size=gui.screenPercent({1,0.1}) }
	gui.Label{text = "Game Engine: love2D https://www.love2d.org/", align="center", pos = gui.screenPercent({0,h+2.1}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "Polygamy library: Pierre-Yves Gérardy", align="center", pos = gui.screenPercent({0,h+2.2}), size=gui.screenPercent({1,0.05}) }
  gui.Label{text = "Deborah Alexander: Fox, Egg and Chicken Sprites", align="center", pos = gui.screenPercent({0,h+2.3}), size=gui.screenPercent({1,0.05}) }
	gui.Label{text = "-", align="center", pos = gui.screenPercent({0,h+2.4}), size=gui.screenPercent({1,0.1}) }
	gui.postDraw()
end

function welcome.after()
end