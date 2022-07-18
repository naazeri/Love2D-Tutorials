function love.load()
    target = {}
    target.x = 300
    target.y = 400
    target.radius = 50

    score = 0

    scoreFont = love.graphics.newFont(35)
end

function love.update(dt)
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setColor(0, 1, 0)
    love.graphics.setFont(scoreFont)
    love.graphics.print(score)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        local distance = distanceBetweenTwoPoint(x, y, target.x, target.y)
        if distance <= target.radius then
            score = score + 1

            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
        end
    end
end

function distanceBetweenTwoPoint(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end
