Bullet = {}

local ass = require "accessAssest"

-- Bullet module



-- table for storing all the bullets
local bulletList = {}


-- attributres for bullets
local bulletSpeed = 800

local img = ass.getAssest("bulletIMG")


function Bullet.shootBullet(x, y, newAngle)
  bullet = {}
  bullet.pos = {}
  bullet.pos.x = x
  bullet.pos.y = y
  bullet.angle = newAngle
  bullet.img = img

  bullet.hitx = bullet.pos.x - bullet.img:getWidth()/4
  bullet.hity = bullet.pos.y - bullet.img:getHeight()/4

  bullet.hitWidth  = bullet.img:getWidth()/2
  bullet.hitHeight = bullet.img:getHeight()/2

  table.insert(bulletList, bullet)
end


function Bullet.updateBullets(dt)
  for i,bullet in ipairs(bulletList) do
    bullet.pos.x = bullet.pos.x + bulletSpeed*dt*math.cos(bullet.angle)
    bullet.pos.y = bullet.pos.y + bulletSpeed*dt*math.sin(bullet.angle)
  end
end

function Bullet.drawBullets(dt, drawHit)
  for i,bullet in ipairs(bulletList) do
    love.graphics.draw(img,
                        bullet.pos.x,
                        bullet.pos.y,
                        bullet.angle + math.pi/2,
                        1,
                        1,
                        img:getWidth()/2,
                        img:getHeight()/2)

    -- update hitbox of bullet
    bullet.hitx = bullet.pos.x - bullet.img:getWidth()/4
    bullet.hity = bullet.pos.y - bullet.img:getHeight()/4

    bullet.hitWidth  = bullet.img:getWidth()/2
    bullet.hitHeight = bullet.img:getHeight()/2

    if (drawHit) then
      love.graphics.rectangle('line',
                              bullet.hitx,
                              bullet.hity,
                              bullet.hitWidth,
                              bullet.hitHeight)
    end
  end
end


return Bullet
