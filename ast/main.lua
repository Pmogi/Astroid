--local entity = require "entity"
local Player = require "player"
local accessAssest = require "accessAssest"

player = Player:new(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0)

function love.draw(dt)
  player:testDraw()
  love.graphics.print(string.format("vx:%d vy:%d", player.vel.x, player.vel.y))
end

function love.load()
  player:setImg(accessAssest.getAssest("playerIMG"))
end

function love.update(dt)
  player:getAction(dt)
end
