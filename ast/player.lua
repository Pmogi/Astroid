-- player module--
-- Inherits from entity, handles player input
--
local name = require "entity"
Player = Entity:new()

-- Derive player class from entity class method new
function Player:new(xNew, yNew, angle, img)
  player = Entity:new(player, xNew, yNew, angle, img)
  setmetatable(player, self)
  self.__index = self

  -- set up other player variables here

  --

  return player

end

-- player methods here

--


return Player
