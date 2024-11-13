
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
  world:setGravity(0, 10000)
  world:addCollisionClass("Solid")

  -- local floor = world:newRectangleCollider(100, 430, 300, 50)
  -- floor:setType('static')

  -- importing modules
  player = require('/modules/player')
  walls = require('/modules/walls')


  -- push setup for fullscreen game
  love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT, {fullscreen = true, vsync = true, resizable = true, stretched = true})
end

function love.update(dt)

  local isMoving = false
  local vx = 0
  local vy = 0

  -- player moviement
  if love.keyboard.isDown("d") then
    vx = player.speed
    -- player.anim = player.animations.walk
    player.scaleX = 2
    isMoving = true
  elseif love.keyboard.isDown("a") then
    vx = - player.speed
   -- player.anim = player.animations.walk
    player.scaleX = -2 
    isMoving = true
  elseif love.keyboard.isDown("space") then
    vy = player.y * - 3
    isMoving = true
  end

  player.collider:setLinearVelocity(vx, vy)

  if isMoving == true then
    player.anim:gotoFrame(1)
  end

  --press the escape key to exit the game
    if love.keyboard.isDown("escape") then
      love.event.quit()
    end

    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()
 
    player.anim:update(dt)

  
end

function love.resize(w,h)
  push:resize(w,h)
end

function love.draw()
  push:start()
    gameMap:draw(0,0)


    local spriteWidth = 32 * 2
    local spriteHeight = 32 * 2
    local offsetX = player.scaleX < 0 and spriteWidth or 0
    player.anim:draw(player.spriteSheet, player.x + offsetX - spriteWidth / 2, player.y - spriteHeight / 2, 0,player.scaleX, 2)

    world:draw()
    push:finish()
end