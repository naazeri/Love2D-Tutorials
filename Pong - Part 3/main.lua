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

-- AABB collision detection
function checkCollision(a, b)
    if a.x + a.width > b.x
        and a.x < b.x + b.width
        and a.y + a.height > b.y
        and a.y < b.y + b.height
    then
        return true
    else
        return false
    end
end