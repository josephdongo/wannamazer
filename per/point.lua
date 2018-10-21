Point = Object:new{x, y}

function Point:copy()
	return self:new{x = self.x, y = self.y}
end

function Point:X(x)
	if x then self.x = x
	else return self.x end
end

function Point:Y(y)
	if y then self.y = y
	else return self.y end
end
