soundmanager = {}
soundmanager.currentsong = nil


function soundmanager:play(sndData)
if  soundmanager.currentSong ~= nil then
  love.audio.stop(soundmanager.currentSong)
  end
  soundmanager.currentSong = sndData
  love.audio.play(sndData)
end

--update
function soundmanager:update()
if soundmanager.currentSong:isStopped() then love.audio.play(soundmanager.currentSong) end
end
