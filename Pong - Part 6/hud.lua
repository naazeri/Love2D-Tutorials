hud = {}

function hud:load()
    self.xPlayerScore = 150
    self.xAiScore = love.graphics.getWidth() - 250

    self.yPlayerScore = 40
    self.yAiScore = self.yPlayerScore

    self.score = {
        player = 0,
        -- player2 = 0,
        ai = 0,
    }

    self.scoreFont = love.graphics.newFont(30)
end

function hud:update(dt)

end

function hud:draw()
    love.graphics.setFont(self.scoreFont)

    love.graphics.print("Player: " .. self.score.player, self.xPlayerScore, self.yPlayerScore)
    love.graphics.print("AI: " .. self.score.ai, self.xAiScore, self.yAiScore)
end
