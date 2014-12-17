
scores = Polygamy.state( "High Scores" )

function scores.before()  end
fullCheck = false
volume=0

function scores.update(dt)  
	
if gui.Button{text = "Back", pos=gui.screenPercent({0.25+0.5/5*2,0.5+(0.5/4)*2}), size=gui.screenPercent({0.5/5,0.5/4}),}
 then Polygamy.state.goto("Welcome Screen") end
	gui.Image{ pos = {0,0}, size= gui.screenPercent({1,1}), image=scoreIMG }


end

function scores.draw() 
	gui.preDraw()


	gui.postDraw()
end


function welcome.after() 

end

