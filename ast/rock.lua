--------------- enemy rock module ---------------
-- inherits from entity

local entity = require "entity"
local ass = require "accessAssest"


Rock = Entity:new()
math.randomseed(69) -- nice

local rockList = {}

function Rock:new(player)
  rock = Entity:new(rock, xNew, yNew, angle, img)
  setmetatable(rock, self)
  self.__index = self

  self.ID = "Rock"
  self.pos = {}
  self.pos.x, self.pos.y = Rock:spawnRockPosition()
  self.angle = Rock:getAngleToPlayer(player)

  -- velocity of entity in x,y
  self.maxVel = 10
  self.accelRate = 10
  self.vel   = {x = 0, y = 0}

  -- velcoity of the entity's rotation
  self.rotVel = 0
  self.maxRotVel = math.pi
  self.accelRotRate = math.pi*2

  self.rotationDir = 0

  -- changable later
  self.img = ass.getAssest("rockIMG")

  -- initilize hitbox information, a rectangle at the center of the ship
  self.hitx = self.pos.x - self.img:getWidth()/4
  self.hity = self.pos.y - self.img:getHeight()/4

  self.hitWidth  = self.img:getWidth()/2
  self.hitHeight = self.img:getHeight()/2



  table.insert(rockList,self)

  return rock
end

-- pick a random side and position to spawn the rock
function Rock:spawnRockPosition()
  side = math.random(1, 4)

  local x = 0
  local y = 0

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

-- getAngleToPlayer:
-- Get the angle that would propell the rock towards the player initially in rads.
function Rock:getAngleToPlayer(player)
  return -math.atan2(player.pos.y, player.pos.x)
end

function Rock:testMove(dt)
  self:accelerationForward(dt, true)
  self:move(dt, true)

  self:accelerationRotation(dt, true, self.rotationDir)
  self:rotate(dt, true, self.rotationDir)

  self:recalculateHitBox()
end

function Rock:draw(hitbox)
  -- drawing the hitbox defaults to false
  hitbox = hitbox or false

  love.graphics.draw(self.img,
                      self.pos.x ,
                      self.pos.y ,
                      self.angle + math.pi/2,
                      0.5, -- scale x
                      0.5, -- scale y
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

function Rock:recalculateHitBox()
  self.hitx = self.pos.x - self.img:getWidth()/4
  self.hity = self.pos.y - self.img:getHeight()/4

  self.hitWidth  = self.img:getWidth()/2
  self.hitHeight = self.img:getHeight()/1.2 - 20
end

return Rock
