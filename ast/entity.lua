--entity module--

-- Entity: new --
-- Makes a new entity
function Entity:new(entity, x, y, img)
  entity = entity or {}
  setmetatable(entity, self)
  self.__index = self

  self.pos = {x=0, y=0}
  self.img = image or nil
  self.angle = angle or 0


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

  accel.x = ()
end
