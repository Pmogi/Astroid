-- Bullet module

local Bullet = {}

function Bullet:new(xNew, yNew, angle)
  bullet = bullet or entity
  setmetatable(entity, self)
  self.__index = self

  -- position of bullet
  self.pos = {x = xNew, y = yNew}



end


return bullet
