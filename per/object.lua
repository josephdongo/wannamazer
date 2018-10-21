Object = {invalid = true,
	state}

function Object:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Object:invalidate()
	self.invalid = true
end

function Object:State(state)
	if state then self.state = state
	else return state end
end
