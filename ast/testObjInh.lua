local testObj = require "testObj"

testObjInh = testObj:new()

function testObjInh:new(o)
  o = o or testObj:new(o)
  setmetatable(o, self)
  self.__index = self

  self.y = 2
  return o
end


function testObjInh:readY()
  print(self.y)
  return
end

return testObj
