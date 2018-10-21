require 'object'
require 'point'

Prism = Object:new{x,
	h, w,
	angle}

function Prism:draw()
	love.graphics.polygon('line', self.top)
	love.graphics.polygon('fill', self.leftFace)
	love.graphics.polygon('fill', self.rightFace)
end

function Prism:init(x, h, w, angle)
	self.x = x
	self.h, self.w = h, w
	self.angle = angle or math.pi / 4

	self.y = math.sin(self.angle) * (self.w / 2)
	self.top = {
		self.x:X(),					self.x:Y() + self.y,
		self.x:X() + (self.w / 2),	self.x:Y(),
		self.x:X() + self.w,		self.x:Y() + self.y,
		self.x:X() + (self.w / 2),	self.x:Y() + (2 * self.y),
	}
	self.leftFace = {
		self.x:X(),					self.x:Y() + self.y,
		self.x:X() + (self.w / 2),	self.x:Y() + (2 * self.y),
		self.x:X() + (self.w / 2),	self.x:Y() + self.h,
		self.x:X(),					self.x:Y() + self.h - self.y
	}
	self.rightFace = {
		self.x:X() + (self.w / 2),	self.x:Y() + (2 * self.y),
		self.x:X() + self.w,		self.x:Y() + self.y,
		self.x:X() + self.w,		self.x:Y() + self.h - self.y,
		self.x:X() + (self.w / 2),	self.x:Y() + self.h
	}
end

function Prism:update(t)
	-- up to child classes to implement
end
