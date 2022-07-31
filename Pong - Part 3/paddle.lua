paddle = {}

function paddle:load()
    self.width = 20
    self.height = 100
    self.x = 20
    self.y = love.graphics.getHeight() / 2 - self.height / 2 -- vertical center
    self.speed = 500
end

function paddle:update(dt)
    paddle:movePaddle(dt)
    paddle:limitPaddle()
end

function paddle:movePaddle(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function paddle:limitPaddle()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function paddle:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
