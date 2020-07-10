--entity module--
Entity = {}

-- table for storing all the entities
local entityTable = {}

-- for storing the number of entities in the entity table
local entityNumber = 0

-- Used as parameter in the calculation of rotation acceleration
rotationalDir = {dirCW  = 1, dirCCW = -1}


-- Entity: new --
-- Makes a new entity
function Entity:new(entity, xNew, yNew, angle, img)
  entity = entity or {}
  setmetatable(entity, self)
  self.__index = self

  --[[
   IMPORTANT NOTE:
   Variables that children classes depend on need to be redefined in the
   new of the child class. Otherwise, it the child class uses
   the variables from the entity class. These variables are used here for the
   definition of the entity class functions.
  ]]

  -- position of entity in x,y
  self.pos = {x = 0, y = 0}

  -- velocity of entity in x,y
  self.maxVel = 300
  self.accelRate = 200
  self.vel   = {x = 0, y = 0}

  -- velcoity of the entity's rotation
  self.rotVel = 0
  self.maxRotVel = math.pi
  self.accelRotRate = math.pi*2

  -- set initial positions of entity
  self.pos.x = xNew or 0
  self.pos.y = yNew or 0

  -- EDIT INPUT OF NEW: is either nil or the img paramater, can be reset useing setImg method
  self.img = nil

  -- starting angle of entity
  self.angle = angle or math.pi

  -- draw angle

  -- insert the new entity into the entity table
  table.insert(entityTable, self)
  -- increment the stored number of entities
  entityNumber = entityNumber + 1

  return entity
end

--- accelerationForward: function for moving a function
--  A FSM for determining the velocity of a moving entity.
--

function Entity:accelerationForward(dt, active)

  active = active or false

  -- dv/dt * dt = velocity
  local velInc = self.accelRate * dt

  if active == true and (self.vel.x < self.maxVel and self.vel.y < self.maxVel) then
    self.vel.x = self.vel.x + velInc
    self.vel.y = self.vel.y + velInc
  end

  -- check the x velocity
  if (active == false) and (math.abs(self.vel.x) ~= 0) then

    -- assert a point where the value is just zero
    if (1 > self.vel.x and self.vel.x > -1) then
      self.vel.x = 0
    else
      -- else deaccelerate as expected
      self.vel.x = self.vel.x - (velInc)
    end
  end

  -- check the y velocity
  if (active == false) and (math.abs(self.vel.y) ~= 0) then

    -- assert still state
    if (1 > self.vel.y and self.vel.y > -1) then
      self.vel.y = 0
    else
    -- deaccelerate
      self.vel.y = self.vel.y - (velInc)
    end
  end
end

-- accelerationRotation
-- A FSM for determining the velocity of a rotation entity
-- CW is positive direction, CCW is neg direction
function Entity:accelerationRotation(dt, active, direction)

  active = active or false

  -- d rad /dt * dt = rad
  local velInc = self.accelRotRate * dt

  -- if player pressed button and not at max, increase velocity.
  if active == true and (self.rotVel < self.maxRotVel and self.rotVel > -self.maxRotVel) then
    self.rotVel = self.rotVel + (velInc*direction)
  end

  -- check the rotational velocity
  if (active == false) and (math.abs(self.rotVel) ~= 0) then

    -- assert a point where the value is just zero
    if (0.3 > self.rotVel and self.rotVel > -0.3) then
      self.rotVel = 0

    -- cause force in opp direction to deaccelerate
    elseif (self.rotVel > 0) then
      self.rotVel = self.rotVel + (velInc*-1)*4
    elseif (self.rotVel < 0) then
      self.rotVel = self.rotVel + (velInc)*4
    end
  end
end

function Entity:move(dt, active)
  self:accelerationForward(dt, active)

  self.pos.x = self.pos.x + self.vel.x*dt*math.cos(self.angle)
  self.pos.y = self.pos.y + self.vel.y*dt*math.sin(self.angle)
end

-- rotate the entity based on it's velocity
function Entity:rotate(dt, active, direction)
  Entity:accelerationRotation(dt, active, direction)
  self.angle = self.angle + (self.rotVel*dt)
end


-- Currently a test function for drawing the entity
-- Later, I'll use a different module for drawing everything in the entity table
function Entity:testDraw()
    --print(self.img:getHeight())
    --print(self.angle)
  love.graphics.draw(self.img,
                      self.pos.x,
                      self.pos.y,
                      self.angle + math.pi/2,
                      1, -- scale x
                      1, -- scale y
                      self.img:getWidth()/2, -- origin offset
                      self.img:getHeight()/2) -- origin offset

  love.graphics.circle("line", self.pos.x,
                               self.pos.y,
                               10)
end

-- getImg
-- Sets a new image for the entity
function Entity:setImg(newImg)
  self.img = newImg
end

function Entity:returnEntNum()
  return entityNumber
end

function Entity:getPos()
  return string.format("%d, %d",self.pos.x, self.pos.y)
end

return Entity
