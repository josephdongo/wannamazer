require 'world'
require 'ball'

directions = {up = {-1, 0},
	down = {1, 0},
	left = {0, -1},
	right = {0, 1}}

r = {1, 0, 0, 0.6}
g = {0, 1, 0, 0.6}
b = {0, 0, 1, 0.6}

tiles =  {
	{{b, g, r}, {r, g, b}, {g, b, r}, {b, g, r}},
	{{b, r, g}, {g, r, b}, {g, b, r}, {r, b, g}},
	{{r, b, g}, {r, b, g}, {b, r, g}, {g, r, b}},
	{{g, b, r}, {b, g, r}, {g, b, r}, {r, b, g}}
}

slider = 1

w = World:new()

function love.load()
	w:init(Point:new{x = 800, y = 400},
		4, 4,
		10)

	transform = love.math.newTransform()
	transform:scale(1, 0.4)
	transform:rotate(math.pi / 6)

	for i = 1,w.h do
		for j = 1, w.w do
			w.tiles[i][j].colors = tiles[i][j]
		end
	end

	local width, height, flags = love.window.getMode()
	flags.resizable = true
	love.window.setMode(width, height, flags)
end

function love.draw()
	if win then
		love.graphics.print('A winner is you', 100, 100)
	else
		love.graphics.replaceTransform(transform)
		w:draw()
	end
end

function love.update(dt)
	if win then return end
	w:update(dt, slider)
end

function love.keyreleased(key, scancode)
	if win then return end
	if directions[key] then
		w:move(directions[key])
		print('moved; x = '..w.y:X()..'; y = '..w.y:Y())
		if w.y:X() == w.w and w.y:Y() == w.h then
			win = true
		end
	elseif key == 'z' and slider > 1 then
		slider = slider - 1
	elseif key == 'x' and slider < 3 then
		slider = slider + 1
	end
end
