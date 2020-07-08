--entity module--
Entity = {}

-- table for storing all the entities
local entityTable = {}

-- for storing the number of entities in the entity table
local entityNumber = 0

-- Entity: new --
-- Makes a new entity
function Entity:new(entity, xNew, yNew, angle, img)
  entity = entity or {}
  setmetatable(entity, self)
  self.__index = self

  -- An ID is assigned in the child entity classes
  self.ID = nil

  -- position of entity in x,y
  self.pos = {x = 0, y = 0}

  -- velocity of entity in x,y
  self.maxVel = 300
  self.accelRate = 200
  self.vel   = {x = 0, y = 0}

  -- acceleration of entity in x,y
  self.accel = {x = 0, y = 0}

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
--  A kinda janky method for accelerating an entity forward.
--

function Entity:accelerationForward(dt, active)

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



function Entity:move(dt, active)
  self:accelerationForward(dt, active)

  self.pos.x = self.pos.x + self.vel.x*dt*math.cos(self.angle)
  self.pos.y = self.pos.y + self.vel.y*dt*math.sin(self.angle)
end

function Entity:testPrint()
  print(entityTable[1].pos.x)
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
