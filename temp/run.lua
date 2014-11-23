function love.run()
  love.math.setRandomSeed(os.time())
  love.event.pump()
  love.load(arg)

  -- We don't want the first frame's dt to include time taken by love.load.
  love.timer.step()

  local dt = 0

  -- Main loop time.
  while true do
    -- Process events.
    love.event.pump()
    for e,a,b,c,d in love.event.poll() do
      if e == "quit" then
        if not love.quit or not love.quit() then
          love.audio.stop()
          return
        end
    love.handlers[e](a,b,c,d)
    end
      if e == "quit" then
        if not love.quit or not love.quit() then
          love.audio.stop()
          return
        end
      end
    love.handlers[e](a,b,c,d)
    end
  
  -- Update dt, as we'll be passing it to update
    love.timer.step()
    dt = love.timer.getDelta()

    -- Call update and draw
    love.update(dt) -- will pass 0 if love.timer is disabled

    if  love.window.isVisible() then
      love.graphics.clear() --Turn this off to make everything look funny
    --  love.graphics.origin()
      love.draw()
      love.graphics.present()
    end

    love.timer.sleep(1/20-dt)
  end
end