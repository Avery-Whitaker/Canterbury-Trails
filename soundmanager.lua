millerGameMusic = love.audio.newSource("assets/millerGame.mp3", "static")
knightGameMusic = love.audio.newSource("assets/knightGame.mp3", "static")
mainMenu = love.audio.newSource("assets/menuMusic.mp3", "static")
wifeOfBathGameMusic = love.audio.newSource("assets/wifeOfBathGame.mp3", "static")
priestMusic = love.audio.newSource("assets/nunsPriestGame.mp3", "static")
town= love.audio.newSource("assets/in a small town.mp3", "static")
road = love.audio.newSource("assets/OnTheRoadMusic.mp3", "static")
marching = love.audio.newSource("assets/marching.mp3", "static")
soundmanager = {}
soundmanager.currentsong = nil


function soundmanager:play(sndData)
if  currentsong ~= nil then
  love.audio.stop(currentsong)
  end
  soundmanager.currentSong = sndData
  love.audio.play(sndData)
end

--update
function soundmanager:update()
if soundmanager.currentSong:isStopped() then love.audio.play(soundmanager.currentSong) end
end
