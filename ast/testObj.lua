testObj = {}

--testObj.__index = testObj

function testObj:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.x = 1

  return o
end

function testObj:readX()
  print(self.x)
end

function testObj:changeX(newX)
  self.x = newX
end

return testObj
