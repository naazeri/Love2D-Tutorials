ball = {}

function ball:load()
    self.width = 20
    self.height = 20
    self.x = love.graphics.getWidth() / 2 - self.width / 2 -- center
    self.y = love.graphics.getHeight() / 2 - self.height / 2 -- center
    self.speed = 300
    self.xVelocity = -self.speed
    self.yVelocity = -50
end

function ball:update(dt)
    ball:move(dt)
    ball:checkCollide()
end

function ball:move(dt)
    self.x = self.x + self.xVelocity * dt
    self.y = self.y + self.yVelocity * dt
end

function ball:checkCollide()
    if checkCollision(self, paddle) then
        self.xVelocity = self.speed

        local middleBall = self.y + self.height / 2
        local middlePaddle = paddle.y + paddle.height / 2
        local collisionPosition = middleBall - middlePaddle

        self.yVelocity = collisionPosition * 5
        -- elseif checkCollision(self, paddleRight) then
    elseif checkCollision(self, ai) then
        self.xVelocity = -self.speed

        local middleBall = self.y + self.height / 2
        -- local middlePaddle = paddleRight.y + paddleRight.height / 2
        local middlePaddle = ai.y + ai.height / 2
        local collisionPosition = middleBall - middlePaddle

        self.yVelocity = collisionPosition * 5
    end

    -- check collision with top or bottom of screen
    local screenHeight = love.graphics.getHeight()
    if self.y < 0 then
        self.y = 0
        self.yVelocity = -self.yVelocity
    elseif self.y + self.height > screenHeight then
        self.y = screenHeight - self.height
        self.yVelocity = -self.yVelocity
    end

    -- check collision with left or right of screen(Score)
    if self.x + self.width < 0 then
        -- score for right side
        self.x = love.graphics.getWidth() / 2 - self.width / 2 -- center
        self.y = love.graphics.getHeight() / 2 - self.height / 2 -- center

        self.xVelocity = self.speed
        self.yVelocity = 50

        hud.score.ai = hud.score.ai + 1
        -- hud.score.player2 = hud.score.player2 + 1

    elseif self.x > love.graphics.getWidth() then
        -- score for left side
        self.x = love.graphics.getWidth() / 2 - self.width / 2 -- center
        self.y = love.graphics.getHeight() / 2 - self.height / 2 -- center

        self.xVelocity = -self.speed
        self.yVelocity = 50

        hud.score.player = hud.score.player + 1
    end
end

function ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
