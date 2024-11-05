
SCREEN_WIDTH, SCREEN_HEIGHT = love.window.getDesktopDimensions()
--CREEN_WIDTH, SCREEN_HEIGHT = SCREEN_WIDTH * 0.8, SCREEN_HEIGHT * 0.8

VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 790, 530
-- readd 320, 240 back to the virtual height when camera is ready to work 790, 640

function love.load()

  -- libraries
  sti = require('libraries.sti')
  gameMap = sti('maps/gameMap.lua')
  push = require('libraries.push-master.push')


  -- importing modules
  player = require('/modules/player')
  walls = require('/modules/walls')


  -- push setup for fullscreen game
  love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT, {fullscreen = true, vsync = true, resizable = true, stretched = true})
end

function love.update(dt)
  --press the escape key to exit the game
    if love.keyboard.isDown("escape") then
      love.event.quit()
    end
end

function love.resize(w,h)
  push:resize(w,h)
end

function love.draw()
  push:start()
    gameMap:draw(0,0)
    love.graphics.draw(player.sprite, player.x, player.y)
    push:finish()
end