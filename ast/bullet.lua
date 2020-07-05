Bullet = {}

local ass = require "accessAssest"

-- Bullet module



-- table for storing all the bullets
local bulletList = {}


-- attributres for bullets
local bulletSpeed = 600

local img = ass.getAssest("bulletIMG")


function Bullet.shootBullet(x, y, newAngle)
  bullet = {}
  bullet.pos = {}
  bullet.pos.x = x
  bullet.pos.y = y
  bullet.angle = newAngle

  print(bullet.pos.x)
  table.insert(bulletList, bullet)
end


function Bullet.updateBullets(dt)
  for i,bullet in ipairs(bulletList) do
    bullet.pos.x = bullet.pos.x + bulletSpeed*dt*math.cos(bullet.angle)
    bullet.pos.y = bullet.pos.y + bulletSpeed*dt*math.sin(bullet.angle)
  end
end

function Bullet.drawBullets(dt)
  for i,bullet in ipairs(bulletList) do
    love.graphics.draw(img,
                        bullet.pos.x,
                        bullet.pos.y,
                        bullet.angle + math.pi/2,
                        1,
                        1,
                        img:getWidth()/2,
                        img:getHeight()/2)
  end
end


return Bullet
