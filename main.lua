function love.load()
    sti = require 'libraries.sti'
    gameMap = sti('maps/Map.lua')
end

function love.update(dt)
    
end

function love.draw()
    gameMap:draw()
end