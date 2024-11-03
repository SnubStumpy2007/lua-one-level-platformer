require "maps.map"

SCREEN_WIDTH = 1000
SCREEN_HEIGHT = 840

local tiles = {
    0,0,1,0,0,0,0,0,
    0,1,1,0,0,0,0,0,
    0,1,0,0,1,1,0,0,
    0,0,0,0,1,1,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0

}

local gMap = Map:New(tiles, 8, 6)

function love.load()
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT, {vsync=true, fullscreen=false})
end

function love.update(dt)
    
end

function love.draw()
    gMap:Render()
end