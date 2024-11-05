sti = require('libraries.sti')
gameMap = sti('maps/gameMap.lua')
push = require('libraries.push-master.push')


SCREEN_WIDTH, SCREEN_HEIGHT = love.window.getDesktopDimensions()
SCREEN_WIDTH, SCREEN_HEIGHT = SCREEN_WIDTH * 0.8, SCREEN_HEIGHT * 0.8

VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 320, 240


function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
    --love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT, {vsync=true, fullscreen=false})
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT, {fullscreen = false, vsync = true, resizable = true})
end

function love.update(dt)
    
end

function love.resize(w,h)
  push:resize(w,h)
end

function love.draw()
  push:start()
    gameMap:draw(0,0)
    push:finish()
end