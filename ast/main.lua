--local entity = require "entity"
local Player = require "player"
local accessAssest = require "accessAssest"
local bulletManager = require "bullet"
local Rock = require "rock"

player = Player:new(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0)
rock   = Rock:new(0, 0, 0)

function love.draw(dt)
  bulletManager.drawBullets()
  player:testDraw()
  rock:testDraw()


  love.graphics.print(string.format("vx:%d vy:%d", player.vel.x, player.vel.y))
end

function love.load()
  player:setImg(accessAssest.getAssest("playerIMG"))
end

function love.update(dt)
  bulletManager.updateBullets(dt)
  player:getAction(dt)
end
