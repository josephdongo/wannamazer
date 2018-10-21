require 'tile'

World = Object:new{
	x, y,
	h, w,
	padding,
	tiles = {},
}

function World:draw()
	for i = 1, self.h do
		for j = 1, self.w do
			self.tiles[i][j]:draw()
		end
	end
end

function World:init(x, h, w, padding)
	self.x = x
	self.h, self.w = h, w
	self.padding = padding or 0

	-- create tiles
	for i = 1, h do
		self.tiles[i] = {}
		for j = 1, w do
			local tile = Tile:new()
			tile:init(Point:new{
					x = self.x:X() + (j - 1) * (tile:W() + self.padding),
					y = self.x:Y() + (i - 1) * (tile:H() + self.padding)
				},
				nil,
				nil,
				{{1, 1, 1, 1}, {1, 1, 1, 1}, {1, 1, 1, 1}})
			self.tiles[i][j] = tile
		end
	end

	self.y = Point:new{x = 1, y = 1}
	self.tiles[1][1]:fill()
	print('init')
end

function World:move(direction)
	if self.y:X() + direction[1] > self.w or
		self.y:X() + direction[1] < 1 then
		return
	elseif self.y:Y() + direction[2] > self.h or
		self.y:Y() + direction[2] < 1 then
		return
	else
		print('got here')
		local oldTile = self.tiles[self.y:X()][self.y:Y()]
		local newTile = self.tiles[self.y:X() + direction[1]][self.y:Y() + direction[2]]

		for i = 1, 4 do
			if oldTile.colors[oldTile.color][i] ~= newTile.colors[newTile.color][i] then return end
		end

		self.y:X(self.y:X() + direction[1])
		self.y:Y(self.y:Y() + direction[2])
		oldTile:fill()
		newTile:fill()
	end
end

function World:update(dt, slider)
	for i = 1, self.h do
		for j = 1, self.w do
			self.tiles[i][j].color = slider
		end
	end
end
