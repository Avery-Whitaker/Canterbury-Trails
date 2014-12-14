stages = {}

stages[1] = {}
stages[2] = {}
stages[3] = {}
stages[4] = {}
stages[5] = {}
stages[6] = {}
stages[7] = {}
stages[1].nextStage = stages[2]
stages[2].nextStage = stages[3]
stages[3].nextStage = stages[4]
stages[4].nextStage = stages[5]
stages[5].nextStage = stages[6]
stages[6].nextStage = stages[7]
stages[1].avalibleCharacters = {}
stages[2].avalibleCharacters = {}
stages[3].avalibleCharacters = {}
stages[4].avalibleCharacters = {}
stages[5].avalibleCharacters = {}
stages[6].avalibleCharacters = {}
stages[7].avalibleCharacters = {}
stages[1].characterAction = {}
stages[2].characterAction = {}
stages[3].characterAction = {}
stages[4].characterAction = {}
stages[5].characterAction = {}
stages[6].characterAction = {}
stages[7].characterAction = {}

stages[1].avalibleCharacters[1] = characters.knight
stages[1].characterAction[1] = function()
Polygamy.state.goto("Knight1-1") 
end
  newChatState({ name = "Knight1-1", character = characters.knight, text = "Hello, Geoffrey! A pleasure to see you, as always.", choices = {
{"Hello, Sir Knight. How are you doing?", function() 
  Polygamy.state.goto("Knight1-2") end},
{"Tell me more about yourself.", function() 
  Polygamy.state.goto("Knight1-3") end},
{"Tell me a story.", function() 
  Polygamy.state.goto("MillerInstructions") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Knight1-2", character = characters.knight, text = "I’m fairly good, thanks. Just worried about my son. Prancing around like he’s the salt of the earth. You know how kids are…", choices = {
{"So, tell me more about yourself.", function() 
  Polygamy.state.goto("Knight1-3") end},
{"Tell me a story.", function() 
  Polygamy.state.goto("MillerInstructions") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Knight1-3", character = characters.knight, text = "Myself? Well, I’ve seen many a battle. I was at the conquering of Alexandria, quite by accident actually. I’m honestly not as great of a knight as others seem to think I am. I was only at the table in Prussia because I was invited by a friend. I actually served most of my time as a mercenary. I’m really not a great knight.", choices = {
{"...", function() 
  Polygamy.state.goto("Knight1-4") end}
}})

  newChatState({ name = "Knight1-4", character = characters.squire, text = "Dad, stop being so humble! I’ll tell you myself: he was at Ayas and Attalia when they were won. He’s fought more in Lithuania and Russia than any other Christian Knight. He’s fought in Turkey, Granada, Benmarin, and the Mediterranean, all with great success. He’s an amazing knight! Of course, he’s far too meek to tell you any of this himself.", choices = {
{"...", function() 
  Polygamy.state.goto("Knight1-5") end}
}})

  newChatState({ name = "Knight1-5", character = characters.knight, text = "[The Knight seems embarrassed by this exposition of his talents. You shouldn’t press him much further.]", choices = {
{"Tell me a story.", function() 
  Polygamy.state.goto("MillerInstructions") end},
  {"Goodbye.", function() 
  canContinue = true
  Polygamy.state.goto("Menu") end}
}})


stages[1].stateMapText = "You are resting at a small tavern"
stages[1].introMapText = "Your journy continues.... Your party rests at a small tavern"
stages[1].continueRejection = "Shouldn't you talk to the knight first?"

