function love.conf(t)
    t.identity = "Canterbury Trails"                   -- The name of the save directory (string)
    t.version = "0.9.1"                -- The LÖVE version this game was made for (string)
    t.console = false                  -- Attach a console (boolean, Windows only)

    t.window.title = "Canterbury Trails"        -- The window title (string)
    t.window.icon = "assets/splashLogo.png"                -- Filepath to an image to use as the window's icon (string)
    t.window.width = 800              -- The window width (number)
    t.window.height = 600              -- The window height (number)
    t.window.borderless = true        -- Remove all border visuals from the window (boolean)
    t.window.resizable = false         -- Let the window be user-resizable (boolean)
    t.window.minwidth = 800              -- Minimum window width if the window is resizable (number)
    t.window.minheight = 600             -- Minimum window height if the window is resizable (number)
    t.window.fullscreen = false        -- Enable fullscreen (boolean)
    t.window.fullscreentype = "normal" -- Standard fullscreen or desktop fullscreen mode (string)
    t.window.vsync = true              -- Enable vertical sync (boolean)
    t.window.fsaa = 8                  -- The number of samples to use with multi-sampled antialiasing (number)
    t.window.display = 1               -- Index of the monitor to show the window in (number)
    t.window.highdpi = true           -- Enable high-dpi mode for the window on a Retina display (boolean). Added in 0.9.1
    t.window.srgb = true              -- Enable sRGB gamma correction when drawing to the screen (boolean). Added in 0.9.1
end
