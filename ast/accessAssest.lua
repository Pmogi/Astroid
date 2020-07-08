------------ Assets Dictionary ------------
local accessAssest = {}

local assets = {}

assets["playerIMG"]  = love.graphics.newImage('assests/player.png')
assets["bulletIMG"]  = love.graphics.newImage('assests/bullet.png')
assets["rockIMG"]    = love.graphics.newImage('assests/meteorBig.png')
assets["backgroundIMG"] = love.graphics.newImage('assests/starBackground.png')
assets["bgQuad"] = love.graphics.newQuad(0,0, love.graphics.getWidth(), love.graphics.getHeight(), 256,256)

--function accessAssest.getAssest(key)
function accessAssest.getAssest(key)
  --print(assets["playerIMG"])
  return assets[key]
end


return accessAssest
