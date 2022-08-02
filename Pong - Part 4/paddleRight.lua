paddleRight = {}

function paddleRight:load()
    self.width = 20
    self.height = 100
    self.x = love.graphics.getWidth() - self.width - 20
    self.y = love.graphics.getHeight() / 2 - self.height / 2 -- vertical center
    self.speed = 500
end

function paddleRight:update(dt)
    paddleRight:movePaddleRight(dt)
    paddleRight:limitPaddleRight()
end

function paddleRight:movePaddleRight(dt)
    if love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
    end
end

function paddleRight:limitPaddleRight()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function paddleRight:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
