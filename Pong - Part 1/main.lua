function love.load()
    width = 20
    height = 100
    x = 20
    y = love.graphics.getHeight() / 2 - height / 2 -- vertical center
    speed = 500
end

function love.update(dt)
    movePaddle(dt)
    limitPaddle()
end

function movePaddle(dt)
    if love.keyboard.isDown("w") then
        y = y - speed * dt
    elseif love.keyboard.isDown("s") then
        y = y + speed * dt
    end
end

function limitPaddle()
    if y < 0 then
        y = 0
    elseif y + height > love.graphics.getHeight() then
        y = love.graphics.getHeight() - height
    end
end

function love.draw()
    love.graphics.rectangle("fill", x, y, width, height)
end
