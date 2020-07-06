-- enemy rock module --
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
  self.pos.x = xNew
  self.pos.y = yNew
  self.angle = angle

  -- changable later
  self.img = ass.getAssest("rockIMG")

  return rock
end

-- pick a random side to spawn the rock
function Rock:spawnRock()


  side = math.random(1, 4)
  print(side)
end

return Rock
