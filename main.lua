
-- SCREEN_WIDTH, SCREEN_HEIGHT = love.window.getDesktopDimensions()
-- SCREEN_WIDTH, SCREEN_HEIGHT = SCREEN_WIDTH * 0.8, SCREEN_HEIGHT * 0.8

-- VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 790, 530
-- readd 320, 240 back to the virtual height when camera is ready to work 790, 640

function love.load()

  -- libraries
  sti = require('libraries.sti')
  gameMap = sti('maps/gameMap.lua')
  push = require('libraries.push-master.push')
  anim8 = require('libraries/anim8')
  love.graphics.setDefaultFilter("nearest", "nearest")
  gamera = require('libraries.gamera')


  -- gamera.lua
   cam = gamera.new(0,0,800,590)

  -- windfield physics 
  wf = require('libraries/windfield')
  world = wf.newWorld(0,0, true)
  world:setGravity(0, 10000)
  world:addCollisionClass("Solid")


  -- importing modules
  player = require('/modules/player')
  walls = require('/modules/walls')


  --push setup for fullscreen game
  -- love.graphics.setDefaultFilter("nearest", "nearest")
  --   push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT, {fullscreen = true, vsync = true, resizable = true, stretched = true})
end

function love.update(dt)

  local isMoving = false
  local vx = 0
  local vy = 0

  -- player moviement
  if love.keyboard.isDown("d") then
    vx = player.speed
     player.anim = player.animations.walk
    player.scaleX = 2
    isMoving = true
  elseif love.keyboard.isDown("a") then
    vx = - player.speed
    player.anim = player.animations.walk
    player.scaleX = -2 
    isMoving = true
  elseif love.keyboard.isDown("space") then
    vy =  - player.jumpVel
    player.anim = player.animations.jump
    isMoving = true
  end


  player.collider:setLinearVelocity(vx, vy)

  if isMoving == false then
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

 -- cam:lookAt(400, 300) -- 400, 300, player.x, player.y
 -- gamera
    cam:setPosition(player.x, player.y)

  local mapW = gameMap.width * gameMap.tilewidth
  local mapH = gameMap.height * gameMap.tileheight
  -- local camW = VIRTUAL_WIDTH / 2
  -- local camH = VIRTUAL_HEIGHT / 2

  -- limit camera to game map
  local w = love.graphics.getWidth()
  local h = love.graphics.getHeight()


end

function love.resize(w,h)
  push:resize(w,h)
end

function love.draw()
 


    local function drawCameraStuff()
      gameMap:draw()
      local spriteWidth = 32 * 2
      local spriteHeight = 32 * 2
      local offsetX = player.scaleX < 0 and spriteWidth or 0
      player.anim:draw(player.spriteSheet, player.x + offsetX - spriteWidth / 2, player.y - spriteHeight / 2, 0,player.scaleX, 2)

    end
    cam:draw(drawCameraStuff)

    world:draw()

end