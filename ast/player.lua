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
  self.ID = "Player"
  self.pos = {}
  self.pos.x = xNew
  self.pos.y = yNew
  self.angle = angle


  -- a timer to prevent the player from spamming bullets
  self.shootingTimer = 0
  self.shootingTimerLimit = .5

  -- drawable used for the player's character
  self.img = img

  -- initilize hitbox information, a rectangle at the center of the ship
  self.hitx = self.pos.x - self.img:getWidth()/4
  self.hity = self.pos.y - self.img:getHeight()/4

  self.hitWidth  = self.img:getWidth()/2
  self.hitHeight = self.img:getHeight()/2

  return player
end

function Player:updateHitBox()
  self.hitx = self.pos.x - self.img:getWidth()/4
  self.hity = self.pos.y - self.img:getHeight()/4

  self.hitWidth  = self.img:getWidth()/2
  self.hitHeight = self.img:getHeight()/2
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
    self:rotate(dt, true, rotationalDir.dirCW)

  elseif (love.keyboard.isDown('a')) then
    self:rotate(dt, true, rotationalDir.dirCCW)
  else
    self:rotate(dt, false)
  end

  if (love.keyboard.isDown('space') and self.shootingTimer > self.shootingTimerLimit) then
    bulletManager.shootBullet(self.pos.x, self.pos.y, self.angle)
    self.shootingTimer = 0
  end

  if (love.keyboard.isDown('escape')) then
    love.event.push('quit')
  end

  -- update the hitbox of the player
  Player:updateHitBox()
end

-- Player:drawPlayer
-- Draws the player and an optional hitbox
function Player:drawPlayer(hitbox)
  -- drawing the hitbox defaults to false
  hitbox = hitbox or false

  love.graphics.draw(self.img,
                      self.pos.x ,
                      self.pos.y ,
                      self.angle + math.pi/2,
                      1, -- scale x
                      1, -- scale y
                      self.img:getWidth()/2, -- origin offset
                      self.img:getHeight()/2) -- origin offset

  if (hitbox) then
  love.graphics.rectangle('line',
                          self.hitx,
                          self.hity,
                          self.hitWidth,
                          self.hitHeight)
    end
end


return Player
