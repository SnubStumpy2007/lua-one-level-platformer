
SCREEN_WIDTH, SCREEN_HEIGHT = love.window.getDesktopDimensions()
--CREEN_WIDTH, SCREEN_HEIGHT = SCREEN_WIDTH * 0.8, SCREEN_HEIGHT * 0.8

VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 790, 530
-- readd 320, 240 back to the virtual height when camera is ready to work 790, 640

function love.load()

  -- libraries
  sti = require('libraries.sti')
  gameMap = sti('maps/gameMap.lua')
  push = require('libraries.push-master.push')
  anim8 = require('libraries/anim8')
  love.graphics.setDefaultFilter("nearest", "nearest")

  -- windfield physics 
  wf = require('libraries/windfield')
  world = wf.newWorld(0,0, true)
  --world:setGravity(0, 150)

  -- test code to test gravity and physics
  rectangle = world:newRectangleCollider(350, 100, 80, 80)



  -- importing modules
  player = require('/modules/player')
 -- walls = require('/modules/walls')


  -- push setup for fullscreen game
  love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT, {fullscreen = true, vsync = true, resizable = true, stretched = true})
end

function love.update(dt)

  -- player moviement
  if love.keyboard.isDown("d") then
    player.x = player.x + 3
  elseif love.keyboard.isDown("a") then
    player.x = player.x - 3
  elseif love.keyboard.isDown("space") then
    player.y = player.y - 3
  end

  --press the escape key to exit the game
    if love.keyboard.isDown("escape") then
      love.event.quit()
    end

    world:update(dt)

    player.anim:update(dt)
  
end

function love.resize(w,h)
  push:resize(w,h)
end

function love.draw()
  push:start()
    gameMap:draw(0,0)
    --love.graphics.draw(player.spriteSheet, player.x, player.y)
    player.anim:draw(player.spriteSheet, player.x, player.y, nil, 2)

    world:draw()
    push:finish()
end