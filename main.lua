--require "maps.map"

sti = require('libraries.sti')
gameMap = sti('maps/gameMap.lua')

SCREEN_WIDTH = 1024
SCREEN_HEIGHT = 640

-- local tiles = {
--     0,0,1,0,0,0,0,0,
--     0,1,1,0,0,0,0,0,
--     0,1,0,0,1,1,0,0,
--     0,0,0,0,1,1,0,0,
--     0,0,0,0,0,0,0,0,
--     0,0,0,0,0,0,0,0

-- }

--vlocal gMap = Map:New(tiles, 8, 6)

function love.load()
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT, {vsync=true, fullscreen=false})
end

function love.update(dt)
    
end

function love.draw()
    gameMap:draw()
end