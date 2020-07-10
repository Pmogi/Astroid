--------- main module ---------

local Player = require "player"
local accessAssest = require "accessAssest"
local bulletManager = require "bullet"
local Rock = require "rock"
local Entity = require "entity"

local drawHitBox = true

-- Used for drawing the background
player = Player:new(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0, accessAssest.getAssest("playerIMG"))
rock   = Rock:new(player)

function love.draw(dt)
  love.graphics.draw(accessAssest.getAssest("backgroundIMG"), accessAssest.getAssest("bgQuad"), 0,0,0,1,1) -- repeats the image across the screen
  bulletManager.drawBullets(dt, drawHitBox)
  player:drawPlayer(drawHitBox)


  -- replace with function that draws all entities
  rock:testDraw()

  love.graphics.print(string.format("vx:%d vy:%d rockAng:%f",
                                    player.vel.x, player.vel.y,
                                    rock.angle))
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
