--------- main module ---------

local Player = require "player"
local accessAssest = require "accessAssest"
local bulletManager = require "bullet"
local Rock = require "rock"
local Entity = require "entity"

-- Used for drawing the background
local quad = love.graphics.newQuad(0,0,love.graphics.getWidth(), love.graphics.getHeight(), 256,254)

player = Player:new(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 0, accessAssest.getAssest("playerIMG"))
rock   = Rock:new(0, 0, 0)

function love.draw(dt)
  love.graphics.draw(accessAssest.getAssest("backgroundIMG"), quad, 0,0,0,1,1) -- repeats the image across the screen

  -- Entity.drawEntities()
  --
  bulletManager.drawBullets(dt, true)
  player:drawPlayer(true)

  -- replace with function that draws all entities
  rock:testDraw()
  

  love.graphics.print(string.format("vx:%d vy:%d", player.vel.x, player.vel.y))
end

function love.load()
  backgroundImg = accessAssest.getAssest("backgroundIMG")
  backgroundImg:setWrap("repeat","repeat")


  player:setImg()
end

function love.update(dt)
  bulletManager.updateBullets(dt, true)
  player:getAction(dt)
end
