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

--Emilys version dont have
stages[1].mapImg = love.graphics.newImage("assets/trail.JPG")
stages[2].mapImg = love.graphics.newImage("assets/trail.JPG")
stages[3].mapImg = love.graphics.newImage("assets/trail.JPG")
stages[4].mapImg = love.graphics.newImage("assets/trail.JPG")
stages[5].mapImg = love.graphics.newImage("assets/trail.JPG")
stages[6].mapImg = love.graphics.newImage("assets/trail.JPG")
stages[7].mapImg = love.graphics.newImage("assets/trail.JPG")

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
  Polygamy.state.goto("KnightInstructions") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Knight1-2", character = characters.knight, text = "I’m fairly good, thanks. Just worried about my son. Prancing around like he’s the salt of the earth. You know how kids are…", choices = {
{"So, tell me more about yourself.", function() 
  Polygamy.state.goto("Knight1-3") end},
{"Tell me a story.", function() 
  Polygamy.state.goto("KinghtInstructions") end},
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
  Polygamy.state.goto("KinghtInstructions") end},
  {"Goodbye.", function() 
  canContinue = true
  Polygamy.state.goto("Menu") end}
}})


stages[1].stateMapText = "You are resting at a small tavern"
stages[1].introMapText = "Your journy continues.... Your party rests at a small tavern"
stages[1].continueRejection = "Shouldn't you talk to the knight first?"

----------

stages[2].avalibleCharacters[1] = characters.squire
stages[2].avalibleCharacters[2] = characters.monk
stages[2].characterAction[1] = function()
Polygamy.state.goto("Squire1-1") end
stages[2].characterAction[2] = function()
Polygamy.state.goto("Monk1-1") end

stages[2].stateMapText = "You are at stage 2"
stages[2].introMapText = "Your journy continues.... You head towards stage 2"
stages[2].continueRejection = "This really hasnt been implemented yet?"

  newChatState({ name = "Squire1-1", character = characters.squire, text = "Hullo, Mr. Pilgrim. Seen any young women about lately?", choices = {
{"No, why do yo ask?", function() 
  Polygamy.state.goto("Squire1-2") end},
{"Tell me about yourself.", function() 
  Polygamy.state.goto("Squire1-3") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Squire1-2", character = characters.squire, text = "Darn. I just wrote this amazing love ballad and I was hoping that you’d know of a nice lady I could court. Do you want to hear it?", choices = {
{"No, that's okay. Tell me about yourself.", function() 
  Polygamy.state.goto("Squire1-3") end},
{"No thanks. Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Squire1-3", character = characters.squire, text = "Oh, okay! Well, I’m a great songwriter and musician, if I do say so myself. I’ve been on several cavalry raids already, and I even have a lady waiting for me back home! Of course, that doesn’t mean that I can’t flirt once or twice while I’m on the road with my father. I can even draw and write. Are you sure you don’t want to hear that song?", choices = {
{"Sure, I'd love to hear it.", function() 
  Polygamy.state.goto("Squire1-4") end}
}})

  newChatState({ name = "Squire1-4", character = characters.squire, text = "Wonderous! *The Squire begins to sing a song.* Thanks for listening!", choices = {
{"A pleasure. Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})


--MONK

  newChatState({ name = "Monk1-1", character = characters.monk, text = "Greetings, Mr. Pilgrim. Pleasure to meet you again.", choices = {
{"Tell me about yourself.", function() 
  Polygamy.state.goto("Monk1-2") end},
{"Teach me how to hunt.", function() 
  Polygamy.state.goto("Monk1-3") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Monk1-2", character = characters.monk, text = " Well, the first thing that you should know about me is that I do enjoy a good spot of hunting every once in a while. All those books that those old stuffy monks wrote about living in cells aren’t worth an oyster! Why shouldn’t we get out and do good in the world once in a while? There are many sights to see in the world, and many beautiful women to meet. My favorite activity, above all, is hunting. The thrill of the chase is like no other.", choices = {
{"Teach me how to hunt.", function() 
  Polygamy.state.goto("Monk1-3") end},
{"Interesting. Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

--this is supposed to unlock hunting...
  newChatState({ name = "Monk1-3", character = characters.monk, text = "Sure thing...\n\n***HUNTING UNLOCKED***", choices = {
{"Well.", function() 
  canHunt = true
  Polygamy.state.goto("menu") end}
}})

-------------------------------------------------------


stages[3].avalibleCharacters[1] = characters.miller
stages[3].characterAction[1] = function()
Polygamy.state.goto("Miller1-1") 
end

stages[3].stateMapText = "You are resting at a small tavern3"
stages[3].introMapText = "Your journy continues.... Your party rests at a small tavern3"
stages[3].continueRejection = "Shouldn't you 3"

  newChatState({ name = "Miller1-1", character = characters.miller, text = "Hey! Who bothers me now - oh, it’s just you. Well, I guess you’re alright.", choices = {
{"Tell me about yourself.", function() 
  Polygamy.state.goto("Miller1-2") end},
{"Tell me a story.", function() 
  Polygamy.state.goto("MillerInstructions") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Miller1-2", character = characters.miller, text = "Oh, well I like to play the bagpipes, and I’m quite good at grinding grain for folks. Sometimes I even grind too much, and end up with the leftovers! On the other hand, when I don’t grind enough, I mix some old grain in with the new, but don’t tell the customers that… (He nudges you and winks.) I do love a good joke, as well. Have you heard the one about the cuckold and the eunuch? So, an eunuch, a cuckold, and a wench walk into a tavern… \n\n(You really don’t want to hear this joke. It’s bound to be absolutely vulgar. )", choices = {
{"Nevermind that. Tell me a story.", function() 
  Polygamy.state.goto("millerStory") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})


-------------------------------------------------------------

stages[4].avalibleCharacters[1] = characters.pardoner
stages[4].avalibleCharacters[2] = characters.reeve

stages[4].stateMapText = "You are resting at a small tavern4"
stages[4].introMapText = "Your journy continues.... Your party rests at a small tavern4"
stages[4].continueRejection = "Shouldn't you talk to the knight first?4"

stages[4].characterAction[1] = function()
Polygamy.state.goto("Pardoner1-1") 
end
  newChatState({ name = "Pardoner1-1", character = characters.pardoner, text = "Well, hello there, good sir.", choices = {
{"Tell me about yourself.", function() 
  Polygamy.state.goto("Pardoner1-2") end},
{"Tell me a story.", function() 
  Polygamy.state.goto("Pardoner1-3") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Pardoner1-2", character = characters.pardoner, text = "I have all sorts of relics. I have everything from the shoulder bone of a holy Jew’s sheep to a piece of the shroud of the Virgin Mary herself. Would you be interested in buying a pardon?... is what I would say if you were in the crowds of people that throng about when I visit churches. You seem to have a good head about you, lad, so I won’t try to sell you anything just yet.", choices = {
{"Tell me a story.", function() 
  Polygamy.state.goto("Pardoner1-3") end},
{"Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Pardoner1-3", character = characters.pardoner, text = "You’re going to need to hand me a draught of moist and malty ale before I tell you any stories.", choices = {
{"Give the Pardoner a DRAUGHT OF ALE", function() --This should detract ale from your inbox...
  Polygamy.state.goto("Pardoner1-4") end},
{"I don't have any ale. Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Pardoner1-4", character = characters.pardoner, text = "Alright, I’ve had some ale, so I’ll show you a bit of my sermon. ", choices = {
{"...", function() 
  Polygamy.state.goto("Pardoner1-5") end}
}})

  newChatState({ name = "Pardoner1-5", character = characters.pardoner, text = "I usually tell them this story about these three guys who find “death” underneath a tree, but death is really a pile of gold. The moral of the story is that you should never give in to the evils of greed and avarice. Of course, my very job involves greed, since the pardons I sell aren’t actually real. The people are so gullible, aren’t they? In all seriousness, you do want to buy a pardon, don’t you? (He calls over to the Host.) Hey, most gracious host, why don’t you  become the first customer? Step right up and open up your purse!", choices = {
{"...", function() 
  Polygamy.state.goto("Pardoner1-6") end}
}})

  newChatState({ name = "Pardoner1-6", character = characters.host, text = "Who do you think you are?!? Why I oughta… I’d rather hold your severed testicles than any holy object of yours! \nKnight: Calm down, calm down. Come on you two, be gracious to each other. We still have quite a ways to go. \nHost: ...Alright, fine. I guess I’ll let it slide this time.", choices = {
{"...", function() 
  Polygamy.state.goto("Pardoner1-7") end},
}})

  newChatState({ name = "Pardoner1-7", character = characters.knight, text = "Calm down, calm down. Come on you two, be gracious to each other. We still have quite a ways to go.", choices = {
{"...", function() 
  Polygamy.state.goto("Pardoner1-8") end},
}})

  newChatState({ name = "Pardoner1-8", character = characters.host, text = "...Alright, fine. I guess I’ll let it slide this time.", choices = {
{"...", function() 
  Polygamy.state.goto("Pardoner1-9") end},
}})

newChatState({ name = "Pardoner1-9", character = characters.pardoner, text = "Well, I never knew our host could be so rude. So, do you want to buy a pardon? You never know when you might need it!\n\n*******PARDONER’S SHOP UNLOCKED*******", choices = {
{"Yes,please.", function() 
  Polygamy.state.goto("pardonerShop") end}, --this should go to the pardoner's shop
  {"No thank you. Goodbye.", function() 
  Polygamy.state.goto("Menu") end}
}})


--P.S. Stage One is "on the road", not "at a tavern" like your intro map text and stateMapText says
--All the odd ones are on the road and all the even ones are at small taverns or something