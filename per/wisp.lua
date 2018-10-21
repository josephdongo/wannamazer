require 'object'
require 'point'

Wisp = Object:new{
	x
}

function Wisp:draw()
end

function Ball:init(x, r)
	self.x = x
end

function Ball:X(x)
	if x then self.x = x
	else return self.x end
end
