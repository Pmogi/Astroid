local entity = require "entity"


local plyer = Entity:new(player, 200, 200 , 200, nil)

print(plyer.pos.x)

--[[player = {
    x = love.graphics.getWidth()/2,
    y = love.graphics.getHeight()/2,
    img = nil,
    angle = math.pi, -- Store this in player table instead, no globals to mess with you.
    speed = 200,

    ax = 0,
    ay = 0,

    vx = 0,
    vy = 0
}
]]--

function love.draw()



end

function love.update(dt)

 --[[
  if(love.keyboard.isDown('up'))    then player.ay = player.ay - 5*dt end
  if(love.keyboard.isDown('down'))  then player.ay = player.ay + 5*dt end
  if(love.keyboard.isDown('left'))  then player.ax = player.ax - 5*dt end
  if(love.keyboard.isDown('right')) then player.ax = player.ax + 5*dt end

  player.vx = player.vx + player.ax * dt
  player.vy = player.vy + player.ay * dt

  player.x = player.x + player.vx * dt
  player.y = player.y + player.vy * dt
  ]]
end
