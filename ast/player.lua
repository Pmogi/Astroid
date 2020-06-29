-- player library --

-- Derive player class from entity class method new
player = Entity:new(entity, x=love.graphics.getWidth()/2,
                            y=love.graphics.getHeight()/2,
                            img=nil)

function Player:new()
