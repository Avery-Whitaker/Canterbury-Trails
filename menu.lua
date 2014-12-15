
local state, goto, pkeyboard = Polygamy.state, Polygamy.state.goto, Polygamy.keyboard   -- for convenience

welcome = state( "Menu" )


avalibleCharacters = {}

canHunt = false
justHunted = false

nextStage = stages[1]

menu = {}

function menu.setStage(a) 
mapImg = a.mapImg
bckImg = a.bckImg
merchentShopUnlocked = a.merchentShopUnlocked
avalibleCharacters = a.avalibleCharacters
characterAction =  a.characterAction
stateMapText = a.stateMapText
introMapText = a.introMapText
nextStage = a.nextStage
continueRejection = a.continueRejection
stageMusic = a.stageMusic

justHunted = false

canContinue = false
       -- canContinue = true
mapText = introMapText
end

function welcome.before()

soundmanager:play(stageMusic)
mapText=stateMapText
 pkeyboard.use( "Menu" ); 
 
  end

foodAlert = false
huntingAlert = false
wentHunting = false

function welcome.update(dt) 
  
  if foodAlert == true then
    if gui.Button{text= "Oops", pos = gui.screenPercent({0.5-0.075, 0.75-0.075}), size= gui.screenPercent({0.15,0.15})} then
      foodAlert = false
    end
    gui.Panel({text = continueRejection, align="left", pos = gui.screenPercent({0.25, 0.25}), size=gui.screenPercent({0.5, 0.5})})
    gui.Panel({text = "", align="left", pos = gui.screenPercent({0, 0}), size=gui.screenPercent({1, 1})})
  end  
  if wentHunting == true then
    if gui.Button{text= "Yay", pos = gui.screenPercent({0.5-0.075, 0.75-0.075}), size= gui.screenPercent({0.15,0.15})} then
      wentHunting = false
    end
    gui.Panel({text = "You have a fun time hunting. No time to keep the meat though!", align="left", pos = gui.screenPercent({0.25, 0.25}), size=gui.screenPercent({0.5, 0.5})})
    gui.Panel({text = "", align="left", pos = gui.screenPercent({0, 0}), size=gui.screenPercent({1, 1})})
  end  

  if huntingAlert == true then
    if gui.Button{text= "Close", pos = gui.screenPercent({0.5-0.075, 0.75-0.075}), size= gui.screenPercent({0.15,0.15})} then
      huntingAlert = false
    end
    gui.Panel({text = "You don't know how to hunt. Maybe someone will teach you?", align="left", pos = gui.screenPercent({0.25, 0.25}), size=gui.screenPercent({0.5, 0.5})})
    gui.Panel({text = "", align="left", pos = gui.screenPercent({0, 0}), size=gui.screenPercent({1, 1})})
  end

  if justHuntAlert == true then
    if gui.Button{text= "Close", pos = gui.screenPercent({0.5-0.075, 0.75-0.075}), size= gui.screenPercent({0.15,0.15})} then
      justHuntAlert = false
    end
  gui.Panel({text = "You just went hunting! You should wait a while", align="left", pos = gui.screenPercent({0.25, 0.25}), size=gui.screenPercent({0.5, 0.5})})
  gui.Panel({text = "", align="left", pos = gui.screenPercent({0, 0}), size=gui.screenPercent({1, 1})})
  end
  
  n = 1
  nMax = #avalibleCharacters
  for key,value in pairs(avalibleCharacters) do --actualcode
    
      
    if gui.Button{text= "Talk to " .. value.name, pos = gui.screenPercent({0.3+(n-1)*(0.7/nMax)+0.025, 0.8}), size= gui.screenPercent({0.7/nMax - 0.05,0.1}), image=value.image } then
      characterAction[key]()
    end
    
    gui.Image{ pos = gui.screenPercent({0.3+(n-1)*(0.7/nMax) + 0.025, 0}), size= gui.imageSize(0.7/nMax - 0.05,value.image), image=value.image }
  
    n = n +1
 end

    gui.Label{text= "Canterbury Trails", pos = gui.screenPercent({0.05, 0}), size= gui.screenPercent({0.2,0.1})}
  if gui.Button{text= "Look at Map", pos = gui.screenPercent({0.05, 0.1}), size= gui.screenPercent({0.2,0.1})} then
  
  Polygamy.state.goto("Map") 
  end
  
 -- if pardonerShopUnlocked then
  --gui.Button{text= "Pardanor Shop", pos = gui.screenPercent({0.05, 0.25}), size= gui.screenPercent({0.2,0.1})}
  --end
  
 -- if merchentShopUnlocked then
  --gui.Button{text= "Merchant Shop", pos = gui.screenPercent({0.05, 0.4}), size= gui.screenPercent({0.2,0.1})}
  --end
  
  if gui.Button{text= "Go Hunting", pos = gui.screenPercent({0.05, 0.55}), size= gui.screenPercent({0.2,0.10})} then 
   if canHunt == true and justHunted == false then
    justHunted = true
   wentHunting = true
    
    elseif canHunt == false then
       huntingAlert = true
  else
     justHuntAlert = true
  end
  
  end
  
 -- if gui.Button{text= "Veiw Inventory", pos = gui.screenPercent({0.05, 0.7}), size= gui.screenPercent({0.2,0.1})} then
 -- Polygamy.state.goto("Inventory") 
  --end
  

   
   if gui.Button{text= "Continue Journey", pos = gui.screenPercent({0.05, 0.85}), size= gui.screenPercent({0.2,0.1})} then
   if canContinue == false then
   foodAlert = true
     else
    -- menu.setStage(nextStage)
  Polygamy.state.goto("Traveling")   
   
   end
 
    
    n = n + 1
end
  gui.Panel({text = "", align="left", pos = gui.screenPercent({0, 0}), size=gui.screenPercent({0.3, 1})})

  gui.Image{ pos = {0,0}, size= gui.screenPercent({1,1}), image=bckImg }
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

