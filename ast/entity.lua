--entity module--
Entity = { pos = {x = 0, y = 0}, img = nil, angle = 0 }

-- table for storing all the entities
local entityTable = {}

-- for storing the number of entities in the entity table
local entityNumber = 0

-- Entity: new --
-- Makes a new entity
function Entity:new(entity, xNew, yNew, angle)
  entity = entity or {}
  setmetatable(entity, self)
  self.__index = self

  -- position of entity in x,y
  self.pos   = {x = 0, y = 0}

  -- velocity of entity in x,y
  self.vel   = {x = 0, y = 0}

  -- acceleration of entity in x,y
  self.accel = {x = 0, y = 0}

  -- set initial positions of entity
  self.pos.x = xNew or 0
  self.pos.y = yNew or 0

  -- img is nil until
  self.img = nil

  -- starting angle of entity
  self.angle = angle or 0

  -- insert the new entity into the entity table
  table.insert(entityTable, self)

  -- increment the stored number of entities
  entityNumber = entityNumber + 1

  return entity
end


--- move: function for moving a function
-- tgs: target speed of the object
--

function Entity:move(tgs, dt)

  local cur_speed = self.vel
  local threshold = 0.4
end

function Entity:testDraw()
  --print(self.pos.x)
  -- love.graphics.circle("line", self.pos.x, self.pos.y, 50)
  love.graphics.draw(self.img,
                      self.x,
                      self.y,
                      self.angle + (math.pi/2),
                      1,
                      1,
                      self.img.getWidth()/2,
                      self.img.getHeight()/2)
end

-- getImg
-- Sets the image for the entity
function Entity:setImg(imgAssestPath)
  self.img = love.graphics.newImage(imgAssestPath)
end


return entity
