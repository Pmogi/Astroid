--local entity = require "entity"
local Player = require "player"
local accessAssest = require "accessAssest"

player = Player:new(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0)

print("obtain inherited: ", player.pos.x)

function love.draw(dt)
  player:testDraw()
  love.graphics.print(player:getPos())

end

function love.load()
  player:setImg(accessAssest.getAssest("playerIMG"))

end

function love.update(dt)

end
