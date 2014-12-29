stages = {}
 
stages[1] = {}
stages[2] = {}
stages[3] = {}
stages[4] = {}
stages[5] = {}
stages[6] = {}
stages[7] = {}
stages[8] = {}

stages[1].nextStage = stages[2]
stages[2].nextStage = stages[3]
stages[3].nextStage = stages[4]
stages[4].nextStage = stages[5]
stages[5].nextStage = stages[6]
stages[6].nextStage = stages[7]
stages[7].nextStage = stages[8]
stages[8].nextStage = nil --actualy makes it go straight to end skips stage 8

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

stages[1].stageMusic = love.audio.newSource("assets/OnTheRoadMusic.mp3", "static")
stages[2].stageMusic = love.audio.newSource("assets/in a small town.mp3", "static")
stages[3].stageMusic = love.audio.newSource("assets/OnTheRoadMusic.mp3", "static")
stages[4].stageMusic = love.audio.newSource("assets/in a small town.mp3", "static")
stages[5].stageMusic = love.audio.newSource("assets/OnTheRoadMusic.mp3", "static")
stages[6].stageMusic = love.audio.newSource("assets/in a small town.mp3", "static")
stages[7].stageMusic = love.audio.newSource("assets/OnTheRoadMusic.mp3", "static" )
stages[8].stageMusic = love.audio.newSource("assets/exciting bagpipe music.mp3", "static" )

stages[1].merchentShopUnlocked = false
stages[2].merchentShopUnlocked = true
stages[3].merchentShopUnlocked = false
stages[4].merchentShopUnlocked = true
stages[5].merchentShopUnlocked = false
stages[6].merchentShopUnlocked = true
stages[7].merchentShopUnlocked = false

stages[1].stateMapText = "Your party is taking a short break."
stages[1].introMapText = "Your journey continues... Your party decides to take a short break."
stages[1].continueRejection = "Shouldn't you talk to the knight first?"
 
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
  canContinue = true
  Polygamy.state.goto("KnightInstructions") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Knight1-2", character = characters.knight, text = "I’m fairly good, thanks. Just worried about my son. Prancing around like he’s the salt of the earth. You know how kids are…", choices = {
{"So, tell me more about yourself.", function()
  Polygamy.state.goto("Knight1-3") end},
{"Tell me a story.", function()
  canContinue = true
  Polygamy.state.goto("KnightInstructions") end},
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
  canContinue = true
  Polygamy.state.goto("KnightInstructions") end},
  {"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
----------------------------------------------------------------------------------------------------------------------------
 
stages[2].avalibleCharacters[1] = characters.squire
stages[2].avalibleCharacters[2] = characters.monk
stages[2].characterAction[1] = function()
  Polygamy.state.goto("Squire1-1") 
end
stages[2].characterAction[2] = function()
  Polygamy.state.goto("Monk1-1") 
end
talkedtoMonk = false
talkedtoSquire = false
 
stages[2].stateMapText = "You are resting at a small tavern"
stages[2].introMapText = "Your journey continues... Your party rests at a small tavern."
stages[2].continueRejection = "You should talk to the Squire and the Monk first!"
 
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
     talkedToSquire = true
stages[2].continueRejection = "You should talk to the Monk first!"
     stages[2].continueRejection = "You should talk to the Monk first!"
     if talkedToSquire and talkedToMonk then
      canContinue = true
    end
  Polygamy.state.goto("Menu") end}
}})
 
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
 
  newChatState({ name = "Monk1-3", character = characters.monk, text = "Sure thing...\n\n***HUNTING UNLOCKED***", choices = {
{"Thank you so much. Goodbye.", function()
  canHunt = true
     stages[2].continueRejection = "You should talk to the Squire first!"
     talkedToMonk = true
     if talkedToSquire and talkedToMonk then
      canContinue = true
    end
  Polygamy.state.goto("Menu") end}
}})
 
----------------------------------------------------------------------------------------------------------------------------------------------------
 
stages[3].avalibleCharacters[1] = characters.miller
stages[3].characterAction[1] = function()
  Polygamy.state.goto("Miller1-1")
end
 
stages[3].stateMapText = "Your party is taking a short break."
stages[3].introMapText = "Your journey continues... Your party decides to take a short break."
stages[3].continueRejection = "You should talk to the Miller first!"
 
  newChatState({ name = "Miller1-1", character = characters.miller, text = "Hey! Who bothers me now - oh, it’s just you. Well, I guess you’re alright.", choices = {
{"Tell me about yourself.", function()
  Polygamy.state.goto("Miller1-2") end},
{"Tell me a story.", function()
  canContinue=true
  Polygamy.state.goto("MillerInstructions") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Miller1-2", character = characters.miller, text = "Oh, well I like to play the bagpipes, and I’m quite good at grinding grain for folks. Sometimes I even grind too much, and end up with the leftovers! On the other hand, when I don’t grind enough, I mix some old grain in with the new, but don’t tell the customers that… (He nudges you and winks.) I do love a good joke, as well. Have you heard the one about the cuckold and the eunuch? So, an eunuch, a cuckold, and a wench walk into a tavern… \n(You really don’t want to hear this joke. It’s bound to be absolutely vulgar. )", choices = {
{"Nevermind that. Tell me a story.", function()
  canContinue=true
  Polygamy.state.goto("MillerInstructions") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
----------------------------------------------------------------------------------------------------------------------------------------------------------
 
stages[4].avalibleCharacters[1] = characters.pardoner
stages[4].avalibleCharacters[2] = characters.reeve
stages[4].stateMapText = "You are resting at a small tavern"
stages[4].introMapText = "Your journey continues... Your party rests at a small tavern."
stages[4].continueRejection = "You should talk to the Pardoner and the Reeve first!"
talkedToPardoner = false
talkedToReeve = false
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
{"Give the Pardoner some of your Ale", function() --This should detract ale from your inbox...
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
 
  newChatState({ name = "Pardoner1-6", character = characters.host, text = "Who do you think you are?!? Why I oughta… I’d rather hold your severed testicles than any holy object of yours!", choices = {
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
 
newChatState({ name = "Pardoner1-9", character = characters.pardoner, text = "Well, I never knew our host could be so rude. So, do you want to buy a pardon? You never know when you might need it!", choices = {
  {"No thank you. Goodbye.", function()
  pardonerShopUnlocked = true
  talkedToPardoner = true
  if talkedToPardoner and talkedToReeve then
    canContinue = true
  end
  Polygamy.state.goto("Menu") end}
}})

stages[4].characterAction[2] = function()
  Polygamy.state.goto("Reeve1-1")
end
newChatState({ name = "Reeve1-1", character = characters.reeve, text = "grumble grumble… mutter… that stupid Miller, oh how i hate him… grumble", choices = {
{"Hello?", function()
  Polygamy.state.goto("Reeve1-2") end}
}})

  newChatState({ name = "Reeve1-2", character = characters.reeve, text = "What? Huh? Oh, it’s you. You’re a pretty decent fellow.", choices = {
{"How are you doing?", function()
  Polygamy.state.goto("Reeve1-3") end},
{"Tell me more about yourself.", function()
  Polygamy.state.goto("Reeve1-8") end},
{"Tell me a story.", function()
  Polygamy.state.goto("Reeve1-9") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Reeve1-3", character = characters.reeve, text = "To tell the truth, I’m pretty angry right now. That Miller just made a complete fool of me. ", choices = {
{"...", function()
  Polygamy.state.goto("Reeve1-4") end}
}})
 
  newChatState({ name = "Reeve1-4", character = characters.miller, text = "Hey, Oswald, you still beating yourself up over that story? Calm down, it was just a joke!", choices = {
{"...", function()
  Polygamy.state.goto("Reeve1-5") end}
}})

  newChatState({ name = "Reeve1-5", character = characters.reeve, text = "Go away, or I might tell a story of a miller being tricked as well.", choices = {
{"...", function()
  Polygamy.state.goto("Reeve1-6") end}
}})

  newChatState({ name = "Reeve1-6", character = characters.miller, text = "What harm can that do? I should say that you should be proud of the carpenter in my story! He managed to snag himself a beautiful woman, and what do you have? ", choices = {
{"...", function()
  Polygamy.state.goto("Reeve1-7") end}
}})

  newChatState({ name = "Reeve1-7", character = characters.reeve, text = "You’re making a fool of yourself. Go away; you’re drunk. \n\n(The Miller leaves.)\n\nHe makes me so angry!", choices = {
{"Tell me about yourself.", function()
  Polygamy.state.goto("Reeve1-8") end},
{"Tell me a story.", function()
  Polygamy.state.goto("Reeve1-9") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Reeve1-8", character = characters.reeve, text = "I used to be a carpenter, but I managed to get a job as a reeve quite a few years back. I’m quite feared by the common people, and I do a very good job of keeping tabs on my lord’s property. He actually rewarded me with this cloak I’m wearing. I originally hail from Norfolk, near the town of Bawdswell. I always try to stay as far away from that stupid Miller as possible, since he always manages to infuriate me.", choices = {
{"Tell me a story.", function()
  Polygamy.state.goto("Reeve1-9") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})

  newChatState({ name = "Reeve1-9", character = characters.reeve, text = "Agh, I’m so mad, I don’t think I can tell a coherent story right now. I’m certainly too old for this. It would probably be a story about making a cuckold and a fool out of a miller.", choices = {
{"Goodbye.", function()
  stages[4].continueRejection = "You should talk to the Pardoner first!"
     talkedToReeve = true
     if talkedToPardoner and talkedToReeve then
      canContinue = true
    end
  Polygamy.state.goto("Menu") end}
}})

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
stages[5].avalibleCharacters[1] = characters.wifeOfBath
stages[5].stateMapText = "Your party is taking a short break."
stages[5].introMapText = "Your journey continues... Your party decides to take a short break."
stages[5].continueRejection = "You should talk to the Wife of Bath first!"
 
 stages[5].characterAction[1] = function()
Polygamy.state.goto("Wife-1")
end
  newChatState({ name = "Wife-1", character = characters.wifeOfBath, text = "Well, hello there, love. You seem like a fine young man. ", choices = {
{"How are you doing?", function()
  Polygamy.state.goto("Wife-2") end},
{"Tell me more about yourself.", function()
  Polygamy.state.goto("Wife-3") end},
{"Tell me a story.", function()
      canContinue = true
  Polygamy.state.goto("WifeOfBathInstructions") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Wife-2", character = characters.wifeOfBath, text = "Oh, quite well, thank you. This trip is turning out to be fun, isn’t it? (The Wife of Bath winks at the Squire, who blushes and turns away.)", choices = {
{"So, tell me more about yourself.", function()
  Polygamy.state.goto("Wife-3") end},
{"Tell me a story.", function()
      canContinue = true
  Polygamy.state.goto("WifeOfBathInstructions") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Wife-3", character = characters.wifeOfBath, text = "Of course I can tell you a little about myself, love. I’ve had five husbands since I was twelve years old, so I find myself very qualified to discuss the important matters of chastity and marriage. I believe first and foremost that chastity is overrated. The Apostle only suggests that chastity is a good idea. The people who want to remain chaste can go right ahead. As the Bible states, a lord has wooden dishes in his house as well as gold. I say that if we have the organs for it, we should use them! God gave us reproductive capabilities for a reason. I also say that the woman should have control over her husband’s body for all his life, just as the Apostle says. (You think to yourself that her Bible interpretations are a bit of a stretch.)", choices = {
{"...", function()
  Polygamy.state.goto("Wife-4") end}
}})
 
  newChatState({ name = "Wife-4", character = characters.pardoner, text = "Now, Miss, you are quite good at preaching on this subject. I might even say you are a better preacher than myself. I was actually about to take a wife, but your story has convinced me that it would be more punishment than reward to do so!", choices = {
{"...", function()
  Polygamy.state.goto("Wife-5") end}
}})
 
  newChatState({ name = "Wife-5", character = characters.wifeOfBath, text = "My story hasn’t even started yet! Return to your spot in line. I will tell you after I’ve finished talking to the kind Pilgrim here.\n(The Pardoner leaves.)\nWhat a poor sap. You remember what I said about having the organs for it? Well, he is one that was... meant to be chaste. Poor soul.\nAny questions?", choices = {
{"Tell me more about your husbands.", function()
  canContinue = true
  Polygamy.state.goto("WifeOfBathInstructions") end},
  {"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})

 --------------------------------------------------------------------------------------------------------------------------------------------------------------

stages[6].avalibleCharacters[1] = characters.prioress
stages[6].avalibleCharacters[2] = characters.host
 
stages[6].stateMapText = "You are resting at a small tavern"
stages[6].introMapText = "Your journey continues... Your party rests at a small tavern."
stages[6].continueRejection = "You should talk to the Prioress and the Host first!"
 
talkedToPrioress = false
talkedToHost = false

stages[6].characterAction[1] = function()
Polygamy.state.goto("Prioress-1")
end
  newChatState({ name = "Prioress-1", character = characters.prioress, text = "BONJOUR, MON AMI. COMMENT ALLEZ-VOUS?", choices = {
{"Please talk in English.", function()
  Polygamy.state.goto("Prioress-2") end},
}})
 
  newChatState({ name = "Prioress-2", character = characters.prioress, text = "Oh, JE ME EXCUSE, dear. I was just practicing my French. Hello, dear. How are you doing?", choices = {
{"Fine, thanks. And you?", function()
  Polygamy.state.goto("Prioress-3") end},
{"Tell me about yourself.", function()
  Polygamy.state.goto("Prioress-4") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Prioress-3", character = characters.prioress, text = " I’m doing quite well myself, thank you for asking. My pooch and I were about to share a nice piece of fantaisie dried steak. (She pulls out a piece of beef jerky.) They told me not to bring any pups, but I managed to sneak my favorite dog with me on the trip. Isn’t that right, poochy woochy? \n(She blows kisses inside her bag. A small yelp comes from inside.)", choices = {
{"Tell me about yourself.", function()
  Polygamy.state.goto("Prioress-4") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Prioress-4", character = characters.prioress, text = "Me? Oh, well my name is Madam Eglantine, and I absolutely adore the French language. I have never been to Paris proper, but I’ve studied French and can speak it quite well, vous ne pensez pas? It’s very important to be a proper lady, such as the ladies in the courts of France. Naturally, I always eat politely, and finish every last crumb on my plate, for to do otherwise would be rude. I also have several pups, who are only to be fed with the finest bread and meat possible. They’re absolutely adorable, aren’t they, poochy smoochy wooch! \n(She blows more kisses to her dog.) \nOh yes, and I have a nun and three priests accompanying me. They help me fetch food for my dogs.", choices = {
{"Thank you. Goodbye.", function()
  talkedToPrioress = true
  if talkedToPrioress and talkedToHost then
    canContinue = true
  end
  Polygamy.state.goto("Menu") end}
}})

stages[6].characterAction[2] = function()
  Polygamy.state.goto("Host-1")
end
  newChatState({ name = "Host-1", character = characters.host, text = "Well, hello there! Are you enjoying the trip so far?", choices = {
{"Yes, it’s quite nice.", function()
  Polygamy.state.goto("Host-2") end},
{"Yes. How are you doing?", function()
  Polygamy.state.goto("Host-3") end},
{"Tell me about yourself.", function()
  Polygamy.state.goto("Host-4") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Host-2", character = characters.host, text = "It truly is. You know, I doubted myself at first when I decided to lead all of you to Canterbury, but I figured that everyone would return to my inn afterwards if I came along. It’s good business, good business indeed.", choices = {
{"How are you doing?", function()
  Polygamy.state.goto("Host-3") end},
{"Tell me about yourself.", function()
  Polygamy.state.goto("Host-4") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Host-3", character = characters.host, text = "I’m doing quite well, thank you. It’s nice to get out of the inn once in a while.", choices = {
{"Tell me about yourself.", function()
  Polygamy.state.goto("Host-4") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Host-4", character = characters.host, text = "Alright! As you know, I am the owner of the inn that you met this group at. I love to tell jokes, and I came up with the idea for everyone to tell stories to one another. It really makes the trip go by faster. I’m certainly glad I came along with you all, as long as you buy a nice hearty supper the minute we get back to the inn! (He laughs)", choices = {
{"Thank you. Goodbye.", function()
     talkedToHost = true
     if talkedToPrioress and talkedToHost then
      canContinue = true
    end
  Polygamy.state.goto("Menu") end}
}})
 
------------------------------------------------------------------------------------------------------------------------------------------------------------

stages[7].avalibleCharacters[1] = characters.nunsPreist
stages[7].stateMapText = "Your party is taking a short break."
stages[7].introMapText = "Your journey continues... Your party decides to take a short break."
stages[7].continueRejection = "You should talk to the Nun's Preist first!"

stages[7].characterAction[1] = function()
  Polygamy.state.goto("Priest-1")
end
  newChatState({ name = "Priest-1", character = characters.prioress, text = "Priest, fetch me a new steak and the finest bread for my pooch! Immediately- oh, hello, Mr. Geoffrey. I didn’t see you there. How are you?", choices = {
{"Fine, thanks. Mind if I borrow your priest for a bit?", function()
  Polygamy.state.goto("Priest-2") end},

}})
 
  newChatState({ name = "Priest-2", character = characters.prioress, text = "Oh, PAS DU TOUT, not at all! As they say in France, L'EAU SOUS LE PONT.", choices = {
{"...", function()
  Polygamy.state.goto("Priest-3") end},

}})
 
  newChatState({ name = "Priest-3", character = characters.nunsPreist, text = "Thanks for getting me out of there. I really appreciate it.", choices = {
{"Tell me about yourself.", function()
  Polygamy.state.goto("Priest-4") end},
{"Tell me a story.", function()
      canContinue = true
  Polygamy.state.goto("PriestInstructions") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
 
  newChatState({ name = "Priest-4", character = characters.nunsPreist, text = "Oh, I don’t do much. I just assist the Prioress.", choices = {
{"Tell me a story.", function()
  canContinue = true;
  Polygamy.state.goto("PriestInstructions") end},
{"Goodbye.", function()
  Polygamy.state.goto("Menu") end}
}})
