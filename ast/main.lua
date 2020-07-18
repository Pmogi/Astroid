--------- main module ---------

local Player = require "player"
local accessAssest = require "accessAssest"
local bulletManager = require "bullet"
local Rock = require "rock"
local Entity = require "entity"

local testObjInh = require "testObjInh"

local t1 = testObjInh:new()
local t2 = testObjInh:new()

print("t1")
print(t1.y)
t1.y = 44

print("t1 Again")
--t1:readY()
print("t2")
--t2:readY()

local drawHitBox = true

-- Used for drawing the background
local player = Player:new(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0, accessAssest.getAssest("playerIMG"))
local player1 = Player:new(love.graphics.getWidth()/2, love.graphics.getHeight()/2+20, 0, accessAssest.getAssest("playerIMG"))

local rock   = Rock:new(rock, player.pos)
local rock2  = Rock:new(rock2, player.pos)


function love.draw(dt)
  love.graphics.draw(accessAssest.getAssest("backgroundIMG"), accessAssest.getAssest("bgQuad"), 0,0,0,1,1) -- repeats the image across the screen
  bulletManager.drawBullets(dt, drawHitBox)
  player:drawPlayer(drawHitBox)


  -- replace with function that draws all entities
  rock:draw(true)
  rock2:draw(true)

  love.graphics.print(string.format("vx:%d vy:%d rock1:%f rock2:%f",
                                    player.vel.x, player.vel.y,
                                    rock.pos.x, rock2.pos.x))
end

function love.load()
  backgroundImg = accessAssest.getAssest("backgroundIMG")
  backgroundImg:setWrap("repeat","repeat")


  player:setImg()
end

function love.update(dt)
  bulletManager.updateBullets(dt, true)
  player:getAction(dt)
  Rock:testMove(dt)
end
