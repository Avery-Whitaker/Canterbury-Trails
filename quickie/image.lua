
local BASE = (...):match("(.-)[^%.]+$")
local core     = require(BASE .. 'core')
local group    = require(BASE .. 'group')
local mouse    = require(BASE .. 'mouse')
local keyboard = require(BASE .. 'keyboard')

-- the widget
-- {pos = {x, y}, size={w, h}, widgetHit=widgetHit, draw=draw, image= imgage}
return function(w)
	assert(type(w) == "table", "Invalid argument")

	-- Generate unique identifier for gui state update and querying.
	local id = w.id or core.generateID()

	-- group.getRect determines the position and size of the widget according
	-- to the currently active group. Both arguments may be omitted.
	local pos, size = group.getRect(w.pos, w.size)
  local image
	-- mouse.updateWidget(id, {x,y}, {w,h}, widgetHit) updates the state for this widget.
	-- widgetHit may be nil, in which case mouse.widgetHit will be used.
	-- The widget mouse-state can be:
	--   hot (mouse over widget),
	--   active (mouse pressed on widget) or
	--   normal (mouse not on widget and not pressed on widget).
	mouse.updateWidget(id, pos, size, w.widgetHit)

	-- keyboard.makeCyclable makes the item focus on tab or whatever binding is
	-- in place (see core.keyboard.cycle). Cycle order is determied by the
	-- order you call the widget functions.
	--keyboard.makeCyclable(id)

	-- core.registerDraw(id, drawfunction, drawfunction-arguments...)
	-- shows widget when core.draw() is called.

	core.registerDraw(id, w.draw or core.style.Image,
		w.image, pos[1],pos[2], size[1],size[2])

	return mouse.releasedOn(id) or keyboard.pressedOn(id, 'return')
end

