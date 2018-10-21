require 'object'
require 'point'

Tile = Object:new{
	x,
	h = 100, w = 100,
	color = 1, colors,
	filled = false
}

function Tile:draw()
	local r, g, b, a = love.graphics.getColor()
	love.graphics.setColor(self.colors[self.color])
	if self.filled then
		love.graphics.rectangle('fill',
			self.x:X(), self.x:Y(),
			self.h, self.w)
	else
		love.graphics.rectangle('line',
		self.x:X(), self.x:Y(),
		self.h, self.w)
	end
	love.graphics.setColor(r, g, b, a)
end

function Tile:fill()
	self.filled = not self.filled
	return self.filled
end

function Tile:init(x, h, w, colors)
	self.x = x
	self.h, self.w = h or 100, w or 100
	self.colors = colors
end

function Tile:X()
	return self.x
end

function Tile:H()
	return self.h
end

function Tile:W()
	return self.w
end
