--[[


Items:
Merchants store
Draught of Ale
Barrel of Ale
Bite of Food
Sack of Food

Pardoner shop:
Pardons from the book (I will look them up after hanging out with family is over)

--]]

-- Keep track of inventory by number has of each item

--[[
inventory = {}

inventory.aleSmall = {}
inventory.aleSmall.name = "Draught of Ale"
inventory.aleSmall.description = "A Tiny Little draught of Ale"
inventory.aleSmall.imageAvalible = love.graphics.newImage("assets/box.png")
inventory.aleSmall.imageUnavalible = love.graphics.newImage("assets/boxBW.png")
inventory.aleSmall.count = 1
inventory.aleSmall.use = function() end
inventory.aleSmall.row = 1
inventory.aleSmall.col = 1
inventory.aleSmall.actions = {}
inventory.aleSmall.actions["Use item"] = function() print("ale used") end
inventory.aleSmall.actions["Give to Pardner"] = function() print("give pardner") end
inventory.aleSmall.actions["Give to Squire"] = function() print("give squire") end
inventory.aleSmall.actions["Sell Item"] = function() print("SOLD") end

newItemState(inventory.aleSmall)

inventory.aleLarge = {}
inventory.aleLarge.name = "Barrel of Ale"
inventory.aleLarge.description = "A Tiny Little draught of Ale"
inventory.aleLarge.imageAvalible = love.graphics.newImage("assets/box.png")
inventory.aleLarge.imageUnavalible = love.graphics.newImage("assets/boxBW.png")
inventory.aleLarge.count = 0
inventory.aleLarge.row = 2
inventory.aleLarge.col = 1
newItemState(inventory.aleLarge)

inventory.foodSmall = {}
inventory.foodSmall.name = "Bite of Food"
inventory.foodSmall.description = "A Tiny Little draught of Ale"
inventory.foodSmall.imageAvalible = love.graphics.newImage("assets/box.png")
inventory.foodSmall.imageUnavalible = love.graphics.newImage("assets/boxBW.png")
inventory.foodSmall.count = 0
inventory.foodSmall.row = 1
inventory.foodSmall.col = 2
newItemState(inventory.foodSmall)

inventory.foodLarge = {}
inventory.foodLarge.name = "Sack of Food"
inventory.foodLarge.description = "A Tiny Little draught of Ale"
inventory.foodLarge.imageAvalible = love.graphics.newImage("assets/box.png")
inventory.foodLarge.imageUnavalible = love.graphics.newImage("assets/boxBW.png")
inventory.foodLarge.count = 0
inventory.foodLarge.row = 2
inventory.foodLarge.col = 2
newItemState(inventory.foodLarge)
--]]
