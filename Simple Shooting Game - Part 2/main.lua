function love.load()
    target = {}
    target.x = 300
    target.y = 400
    target.radius = 50

    score = 0
    timer = 0
    countdownd = 10 -- in second
    isGameRunning = true

    scoreFont = love.graphics.newFont(35)
end

function love.update(dt)
    if timer > 1 then
        timer = timer - 1
        countdownd = countdownd - 1
    end

    if countdownd > 0 then
        timer = timer + dt
    else
        isGameRunning = false
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1) -- white
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setFont(scoreFont)

    if countdownd > 0 then
        love.graphics.setColor(0, 1, 0) -- green
        love.graphics.print("Time Left: " .. countdownd, 250, 0)
    else
        love.graphics.setColor(1, 0, 0) -- red
        love.graphics.print("Finish", 250, 0)
    end

    love.graphics.print("Score: " .. score)
end

function love.mousepressed(x, y, button, istouch, presses)
    if isGameRunning == true and button == 1 then -- left click
        local distance = distanceBetweenTwoPoint(x, y, target.x, target.y)

        if distance <= target.radius then
            score = score + 1

            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
        else
            score = score - 1
        end
    end
end

function distanceBetweenTwoPoint(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end
