--------------- enemy rock module ---------------
-- inherits from entity

local entity = require "entity"
local ass = require "accessAssest"

Rock = Entity:new()
math.randomseed(69) -- nice

function Rock:new(xNew, yNew, angle, img)
  rock = Entity:new(rock, xNew, yNew, angle, img)
  setmetatable(rock, self)
  self.__index = self
  self.pos = {}
  self.pos.x, self.pos.y = Rock:spawnRockPosition()
  self.angle = angle



  -- changable later
  self.img = ass.getAssest("rockIMG")

  return rock
end

-- pick a random side and position to spawn the rock
function Rock:spawnRockPosition()
  side = math.random(1, 4)

  local x = 0
  local y  = 0

  -- top
  if (side == 1) then
    x = math.random(0, love.graphics.getWidth())
    y = 0
  -- right
  elseif (side == 2) then
    x = 0
    y = math.random(0, love.graphics.getHeight())

  -- bottom
  elseif (side == 3) then
    x = math.random(0, love.graphics.getWidth())
    y = love.graphics.getHeight()

  --left
  else
    x = love.graphics.getWidth()
    y = math.random(0, love.graphics.getHeight())

  end

  -- return the position of the new rock
  return x, y-200
end


return Rock
