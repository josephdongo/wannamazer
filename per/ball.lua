require 'object'
require 'point'

Wisp = Object:new{
	x,
	particle,
	speed = 20,
	system,
	target = {x, angle, speed}
}

function Wisp:draw()
	love.graphics.draw(self.system, self.x:X(), self.x:Y())
end

function Wisp:init(x, particle)
	self.x = x
	self.system = love.graphics.newParticleSystem(particle, 32)

	-- fine tuning
	self.system:setParticleLifetime(2, 5)
	self.system:setEmissionRate(5)
	self.system:setSizeVariation(1)
	self.system:setLinearAcceleration(-20, -20, 20, 20)
	self.system:setColors(1, 1, 1, 1, 1, 1, 1, 0)
end

function Wisp:move(x)
	self.state = 'moving'
	self.target.x = x
	self.target.angle = math.atan((self.x:Y() - x:Y()) /
		(self.x:X() - x:X()))
	self.target.speed = Point:new{
		x = self.speed * math.cos(self.target.angle),
		y = self.speed * math.sin(self.target.angle)
	}
end

function Wisp:X(x)
	if x then self.x = x
	else return self.x end
end

function Wisp:update(dt)
	if self.state == 'moving' then
		self.x:X(self.x:X() + dt * self.target.speed:X())
		self.x:Y(self.x:Y() + dt * self.target.speed:Y())

		-- print('moving')
	end

	self.system:update(dt)
end
