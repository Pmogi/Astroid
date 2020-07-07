------ Depricated initial version from years ago ------

debug = false
getHeight = love.graphics.getHeight()
getWidth = love.graphics.getWidth()

--setting the shoot variable global so I can easily access and change it
canShoot = true
canShootTimerMax = 1
canShootTimer = canShootTimerMax

function CheckCollision(obj1x)

end

-- player starting location and image
createEnemyTimerMax = 0.5

createEnemyTimer = createEnemyTimerMax

player = {
    x = love.graphics.getWidth()/2,
    y = love.graphics.getHeight()/2,
    img = nil,
    angle = math.pi, -- Store this in player table instead, no globals to mess with you.
    speed = 200
}

-- table that holds bullet objects
bullets = {}

-- making a table to hold enemies
enemies = {
    speed = 200
}

function love.load(arg)
    --loading images for the game
    player.img = love.graphics.newImage('assests/player.png')
    bulletImg = love.graphics.newImage('assests/bullet.png')
    bigAstroid = love.graphics.newImage('assests/meteorBig.png')
    -- this block here is for making a background that tiles
    backgroundImg = love.graphics.newImage('assests/starBackground.png')
    backgroundImg:setWrap("repeat","repeat")
    quad = love.graphics.newQuad(0,0,love.graphics.getWidth(), love.graphics.getHeight(), 256,254)
end


function love.update(dt)
    -- the timer will constantly subtract
    canShootTimer = canShootTimer - (1*dt)

    -- if the timer is below 0 seconds, the canShoot will return tru
    if canShootTimer < 0 then
        canShoot = true
    end

    createEnemyTimer = createEnemyTimer - (1*dt)
    if createEnemyTimer < 0 then
        createEnemyTimer = createEnemyTimerMax

        -- picks a random side for the astroid to come out of
        axisRandChoice = math.random(4)

        -- 0 will be if the right side is chosen
        if axisRandChoice == 1 then
            newEnemy = {img = bigAstroid , x = love.graphics.getWidth() - 5, y = math.random(0, getHeight), rotation = 0}
            table.insert(enemies, newEnemy)
            createEnemyTimer = createEnemyTimerMax
        end
        -- 1 will be if the left is chosen
        if axisRandChoice == 2 then
            newEnemy = {img = bigAstroid, x = -20, y = math.random(0, getHeight), rotation = 0}
            table.insert(enemies, newEnemy)
            createEnemyTimer = createEnemyTimerMax
        end
        -- 2 will be top side
        if axisRandChoice == 3 then
            newEnemy = {img = bigAstroid, x = math.random(0, love.graphics.getWidth()), y = -20, rotation = 0}
            table.insert(enemies, newEnemy)
            createEnemyTimer = createEnemyTimerMax
        end
        -- 3 will be the bottom side
        if axisRandChoice == 4 then
            newEnemy = {img = bigAstroid, x = math.random(0, love.graphics.getWidth()), y = love.graphics.getHeight() - 5, rotation = 0}
            table.insert(enemies, newEnemy)
            createEnemyTimer = createEnemyTimerMax
        end
    end


    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    if love.keyboard.isDown('a') then
        player.angle = player.angle - (dt * 5 * math.pi/2)
    end

    if love.keyboard.isDown('d') then
        player.angle = player.angle + (dt * 5 * math.pi/2)
    end
-- make sure the player is within the game window
    if player.x < getWidth or player.y < getHeight or player.x > 0 or player.y > 0 then
        if love.keyboard.isDown('w') then
            player.x = player.x + player.speed * (math.cos(player.angle) * dt)
            player.y = player.y + player.speed * (math.sin(player.angle) * dt)
        end
    end

    if love.keyboard.isDown('space') and canShoot then

        newBullet = {
            img = bulletImg,
            x = player.x,
            y = player.y,
            speed = 250,
            angle = player.angle -- Unique variable for each bullet, because you need it.
        }
        table.insert(bullets, newBullet)
        canShoot = false
        canShootTimer = canShootTimerMax
    end

    for i, bullet in ipairs(bullets) do
        bullet.x = bullet.x + ( math.cos(bullet.angle) * 250 * dt)
        bullet.y = bullet.y + ( math.sin(bullet.angle) * 250 * dt)
    end
    for i, bullet in ipairs(bullets) do
      if bullet.x < -20 or bullet.x > (love.graphics.getWidth() + 10) then
        table.remove(bullets, i)
      elseif bullet.y < -20 or bullet.y > (love.graphics.getHeight() + 10) then
        table.remove(bullets, i)
      end
    end

    for i, enemy in ipairs(enemies) do
        -- this variable stores the angle between the astroid and then player
        enemy.angle = math.atan( (enemy.y - player.y) / (enemy.y - player.x))
        enemy.x = enemy.x + (enemies.speed * math.cos(enemy.angle) * dt)
        enemy.y = enemy.y + (enemies.speed * math.sin(enemy.angle) * dt)

        -- get some random rotation speed so they look purty and different
        enemy.rotation = enemy.rotation + ((math.pi+math.pi*math.random(1/16, 1/2)) * dt)
    end
    for i, enemy in ipairs(enemies) do
        if enemy.x < -500 or getWidth + 500 then
            table.remove(enemies, i)
        end

        if enemy.y > -500 or getHeight + 500 then
            table.remove(enemies, i)
        end
    end
end



function love.draw(dt)
    -- background for the screen
    love.graphics.draw(backgroundImg, quad, 0,0,0,1,1) -- repeats the image across the screen
    -- for each bullet in bullets draw them
    for i, bullet in ipairs(bullets) do
        love.graphics.draw(bullet.img, bullet.x, bullet.y, bullet.angle + (math.pi/2))
    end
    -- draw the player image with it's origin at the center of the image
    love.graphics.draw(player.img, player.x, player.y, player.angle + (math.pi/2), 1, 1,  player.img:getWidth()/2, player.img:getHeight()/2)

    for i, enemy in ipairs(enemies) do
        love.graphics.draw(enemy.img, enemy.x, enemy.y)
    end
end
