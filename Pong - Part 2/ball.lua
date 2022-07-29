ball = {}

function ball:load()
    self.width = 20
    self.height = 20
    self.x = love.graphics.getWidth() / 2 - self.width / 2 -- center
    self.y = love.graphics.getHeight() / 2 - self.height / 2 -- center
    self.speed = 200
    self.xVelocity = -self.speed
    self.yVelocity = -50
end

function ball:update(dt)
    ball:move(dt)
end

function ball:move(dt)
    self.x = self.x + self.xVelocity * dt
    self.y = self.y + self.yVelocity * dt
end

function ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
