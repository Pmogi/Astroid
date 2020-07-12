local Player = require "player"
local accessAssest = require "accessAssest"
local bulletManager = require "bullet"
local Rock = require "rock"

EnemyManager = {}


-- Timer Variables ---
-- for timing the spawn of new enemies
local newEnemyTimer = 0

-- initially 1 second, random duration on each spawn
local newEnemyTimerLimit = 1

-- Table for storing enemy entities --
-- NOTE: Make sure to update the table when writing this module like the bullet
-- module.

local drawHitBox = true

enemyTable = {}
-----------------------------------------------------------

function EnemyManager.checkToSpawnEnemy(dt)
  -- increment the enemy Timer
  newEnemyTimer = newEnemyTimer + 1*dt

  if (newEnemyTimer >= newEnemyTimerLimit) then

    -- assign a new enemy timer limit
    newEnemyTimerLimit = math.random(2, 10)
    newEnemyTimer = 0

    newRock = Rock:new()
  end
end

function EnemyManager.drawEnemies()
  for i,enemy in ipairs(enemyTable) do
    enemy:draw(drawHitbox)
  end
end

return EnemyManager
