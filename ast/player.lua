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
  self.angle = angle

  return player
end


function Player:getAction(dt)

  -- if W is down, then accelerate forwards
  if (love.keyboard.isDown('w')) then
    self:move(dt, true)

  -- otherwise the player is deaccelerating back to 0
  else
    self:move(dt, false)
  end

  -- rotating the player with a and d
  if (love.keyboard.isDown('d')) then
    self.angle = self.angle + (math.pi*dt)
  end

  if (love.keyboard.isDown('a')) then
    self.angle = self.angle - (math.pi*dt)
  end
end



return Player
