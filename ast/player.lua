-- player module--
-- Inherits from entity, handles player input
--
local name = require "entity"
local bulletManager = require "bullet"

Player = Entity:new()

-- A timer to prevent the player from spamming bullets

-- Derive player class from entity class method new
function Player:new(xNew, yNew, angle, img)
  player = Entity:new(player, xNew, yNew, angle, img)
  setmetatable(player, self)
  self.__index = self

  -- set up other player variables here
  --
  self.angle = angle

  -- a timer to prevent the player from spamming bullets
  self.shootingTimer = 0
  self.shootingTimerLimit = .5

  return player
end


function Player:getAction(dt)
  -- inc the shooting timer
  self.shootingTimer = self.shootingTimer + 1*dt

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

  if (love.keyboard.isDown('space') and self.shootingTimer > self.shootingTimerLimit) then
    bulletManager.shootBullet(self.pos.x, self.pos.y, self.angle)
    self.shootingTimer = 0
  end

  if (love.keyboard.isDown('escape')) then
    love.event.push('quit')
  end
end



return Player
