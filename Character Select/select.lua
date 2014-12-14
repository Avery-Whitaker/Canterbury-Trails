
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

scores = state( "Character Select" )

function scores.before() pkeyboard.use( "Character Select" ); end
fullCheck = false
volume=0

function scores.update(dt)  
	
if gui.Button{text = "Select", pos=gui.screenPercent({0.21-0.128,0.888-.1077}), size=gui.screenPercent({0.138,0.1277}),}
 then Polygamy.state.goto("Begin") end


	gui.Image{ pos = {0,0}, size= gui.screenPercent({1,1}), image=selectIMG }
end

function scores.draw() 
	gui.preDraw()


	gui.postDraw()
end

pkeyboard( "Character Select" ):setConfig( "pressed", {
	escape            = function() goto("Welcome Screen")        end,
	[Polygamy.default] = print
})


function welcome.after() 

end

