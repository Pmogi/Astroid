--entity module--
Entity = { pos = {x = 0, y = 0}, img = nil, angle = 0 }

-- table for storing all the entities
local entityTable = {}

-- for storing the number of entities in the entity table
local entityNumber = 1

-- Entity: new --
-- Makes a new entity
function Entity:new(entity, xNew, yNew, angle, img)
  entity = entity or {}
  setmetatable(entity, self)
  self.__index = self

  self.pos = {x = 0, y = 0}

  self.pos.x = xNew or 0
  self.pos.y = yNew or 0

  self.img = img or nil
  
  self.angle = angle or 0

  -- insert the object


  -- increment the stored number of entities
  entityNumber = entityNumber + 1

  print(self.pos.x)

  return entity
end


--- move: function for moving a function
-- tgs: target speed of the object
--

function Entity:move(tgs, a, dt)

  local cur_speed = self.velocity
  local threshold = 0.4

  cur_speed.x = accel.x * tgs.x + (1 - accel.x) * cur_speed.x
  cur_speed.y = accel.y * tgs.y + (1 - accel.y) * cur_speed.y


end

function Entity:draw(x, y)
  love.graphics.circle("line", x, y, 50)
end

return entity
