
Polygamy.Tools={}

Polygamy.Tools.nop = function() end






--------------------------------------------------------------------------------

Polygamy.Tools.swallow = function( ... )
       --=============--

	-- The tupple pattern with a fancy name :-)

	local n, arg = select( '#', ... ), {...}
	return function() return unpack( arg, 1, n ) end
end


--------------------------------------------------------------------------------
do
local mt
Polygamy.Tools.Set = {
       --=========--

-- based on the example from PiL, 1st edition.


	
new = function( self, t )
		local set = {}
		setmetatable( set, mt )
		
		local t = t or {}
    	for _, ele in ipairs( t ) do set[ele] = true end
    	return set
    end,

    union = function( a, b )
      local res = a:new{}
      for k in pairs( a ) do res[k] = true end
      for k in pairs( b ) do res[k] = true end
      return res
    end,

    inter = function( a, b )
      local res = a:new{}
      for k in pairs( a ) do
        res[k] = b[k]
      end
      return res
    end,
	
	minus = function( a, b )
		local res = a:new()
		for k in pairs( a ) do
			if not b[k] then res[k]=true end
		end
		return res
	end,
	
	cardinality = function( s )
		c=0
		for k in pairs( s ) do
			c=c+1
		end
		return c
	end,
	
	addElements = function( a, b )
		local ary = type( b ) == "table" and b or {b}
		return a + a:new( b )
	end,
	
	tostring = function( set )
		local s = "Set: {"
		local sep = ""
		for e in pairs( set ) do
			s = s .. sep .. e
			sep = ", "
		end
		return s .. "}"
	end
}
local Set=Polygamy.Tools.Set
mt = {
	__add = Set.union,
	__mul = Set.inter,
	__sub = Set.minus,
	__concat = Set.addElement,
	--__len = Set.cardinality, -- Uncomment me in Lua 5.2
	__index = Set,
	__tostring=Set.tostring
}

end