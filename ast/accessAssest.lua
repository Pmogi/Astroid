-- Assets Dictionary
local accessAssest = {}

local assets = {}

assets["playerIMG"] = love.graphics.newImage('assests/player.png')


--function accessAssest.getAssest(key)
function accessAssest.getAssest(key)
  --print(assets["playerIMG"])
  return assets[key]
end


return accessAssest
