------------ Bullet module ------------

Bullet = {}

local ass = require "accessAssest"

-- table for storing all the bullets
local bulletList = {}


-- attributres for bullets
local bulletSpeed = 800

local img = ass.getAssest("bulletIMG")

-- shootBullet --
-- Creates a new bullet and appends the bullet to the bullet table.
-- x,y position and the angle of the emitter is passed in as a starting point
-- for the bullet.
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

-- updateBullets --
-- Increases the bullets position with constant velocity determined by the
-- modular variable bulletSpeed.
function Bullet.updateBullets(dt, drawHit)
  drawhit = drawHit or false

  for i,bullet in ipairs(bulletList) do
    bullet.pos.x = bullet.pos.x + bulletSpeed*dt*math.cos(bullet.angle)
    bullet.pos.y = bullet.pos.y + bulletSpeed*dt*math.sin(bullet.angle)
  end
end

-- drawBullets --
-- Draws the bullets
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

    -- update hitbox of bullet by calling the function
    Bullet.updateHitBox(bullet)

    -- conditional for drawing the hitbox of the bullet
    if (drawHit) then
      print(type(bullet))
      love.graphics.rectangle('line',
                              bullet.hitx,
                              bullet.hity,
                              bullet.hitWidth,
                              bullet.hitHeight)
    end
  end
end

function Bullet.updateHitBox(bullet)
  bullet.hitx = bullet.pos.x - bullet.img:getWidth()/4
  bullet.hity = bullet.pos.y - bullet.img:getHeight()/4

  bullet.hitWidth  = bullet.img:getWidth()/2
  bullet.hitHeight = bullet.img:getHeight()/2
end

return Bullet
