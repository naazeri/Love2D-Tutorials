ai = {}

function ai:load()
    self.width = 20
    self.height = 100
    self.x = love.graphics.getWidth() - self.width - 20
    self.y = love.graphics.getHeight() / 2 - self.height / 2 -- vertical center
    self.speed = 500
    self.yVelocity = 0
    self.timer = 0
    self.tick = 0.6
end

function ai:update(dt)
    ai:move(dt)

    self.timer = self.timer + dt
    if self.timer > self.tick then
        self.timer = 0
        ai:followTarget()
    end
end

function ai:move(dt)
    self.y = self.y + self.yVelocity * dt
end

function ai:followTarget()
    if self.y > ball.y + ball.height then -- paddle is below the ball
        self.yVelocity = -self.speed
    elseif self.y + self.height < ball.y then -- paddle is above the ball
        self.yVelocity = self.speed
    else
        self.yVelocity = 0
    end
end

function ai:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
