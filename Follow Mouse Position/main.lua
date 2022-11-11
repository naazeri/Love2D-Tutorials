function love.load()
    playerX = 0
    playerY = 0
    playerSpeed = 200
end

function love.update(dt)
    mouseX, mouseY = love.mouse.getPosition() -- get the current position of the mouse

    if playerX < mouseX then
        -- mouse is on right side
        playerX = playerX + playerSpeed * dt
    elseif playerX > mouseX then
        -- mouse is on left side
        playerX = playerX - playerSpeed * dt
    end

    if playerY < mouseY then
        -- mouse is on down side
        playerY = playerY + playerSpeed * dt
    elseif playerY > mouseY then
        -- mouse is on up side
        playerY = playerY - playerSpeed * dt
    end
end

function love.draw()
    love.graphics.circle("fill", playerX, playerY, 40)
end
