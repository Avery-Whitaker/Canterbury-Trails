--[[
DISPLAY TEXT

REPLACE DEFAULT TEXT DISPLAYING BEHAVIOR
display as large as can fit in box rather then font
--]]

fonts={}

function gui.preloadFonts()
--[[
fonts={}
for i = 1, 100, 1 do
  fonts[i] = love.graphics.newFont("assets/LobsterTwo-BoldItalic.otf", i)
end
--]]
end

function gui.printText(text, x, y, w, h, align, style, wrap)
--[[
local size = math.floor(h)
if(fonts[size] == nil) then
  fonts[size] = love.graphics.newFont("assets/oldenglishregular.ttf", size)
end
--]]

--[[
font = fonts[size]
while(font:getWidth(text) > w) do
  size = size - 1
  if(fonts[size] == nil) then
    fonts[size] = love.graphics.newFont("assets/oldenglishregular.ttf", size)
  end
  font = fonts[size]
end

love.graphics.setFont(fonts[size])
--]]
if wrap == nil or wrap == false then

local imin = 1
local imax = math.floor(h)


while(imax > imin) do

  imid = math.floor((imin+imax)/2)

  if(fonts[style .. "|".. imid] == nil) then
    fonts[style .. "|".. imid] = love.graphics.newFont(style, imid)
  end

  if(fonts[style .. "|" .. imid]:getWidth(text) < w) then
    imin = imid +1
  else
    imax = imid
  end
end
love.graphics.setFont(fonts[style .. "|".. imid])

  y = y + (h - love.graphics.getFont():getHeight(text))/2
  if (align == "center" )then
  x = x + (w - love.graphics.getFont():getWidth(text))/2
  elseif (align == "right") then
  x = x + (w - love.graphics.getFont():getWidth(text))
  end
  love.graphics.print(text, x, y, 0, 1, 1)
else
local imin = 1
local imax = math.floor(h)

--make a max height for wrapped text
if imax > gui.screenHeight()*0.035 then imax = gui.screenHeight()*0.035 end


while(imax > imin) do

  imid = math.floor((imin+imax)/2)

  if(fonts[style .. "|".. imid] == nil) then
    fonts[style .. "|".. imid] = love.graphics.newFont(style, imid)
  end
  tw, tl = fonts[style .. "|".. imid]:getWrap(text, w)
  th = fonts[style .. "|".. imid]:getHeight()
  tlh = fonts[style .. "|".. imid]:getLineHeight()
  if(th*tlh*tl < h ) then  --and th*tlh*tl>h-th*tlh) then
    imin = imid +1
  else
    imax = imid
  end
end
love.graphics.setFont(fonts[style .. "|".. imid])

  love.graphics.printf( text, x, y, w, align)
end

end