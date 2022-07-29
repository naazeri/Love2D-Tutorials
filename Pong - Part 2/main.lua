require("paddle")
require("ball")

function love.load()
    paddle:load()
    ball:load()
end

function love.update(dt)
    paddle:update(dt)
    ball:update(dt)
end

function love.draw()
    paddle:draw()
    ball:draw()
end
