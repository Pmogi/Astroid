-- Assets Dictionary
local accessAssest = {}

local assets = {}

assets["playerIMG"]  = love.graphics.newImage('assests/player.png')
assets["bulletIMG"]  = love.graphics.newImage('assests/bullet.png')
assets["rockIMG"]    = love.graphics.newImage('assests/meteorBig.png')
assets["backGround"] = love.graphics.newImage('assests/starBackground.png')

--function accessAssest.getAssest(key)
function accessAssest.getAssest(key)
  --print(assets["playerIMG"])
  return assets[key]
end


return accessAssest
