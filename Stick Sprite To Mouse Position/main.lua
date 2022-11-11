function love.load()
end

function love.update(dt)
end

function love.draw()
    mouseX, mouseY = love.mouse.getPosition() -- get the current position of the mouse
    love.graphics.circle("fill", mouseX, mouseY, 40)
end
