
SCREEN_WIDTH, SCREEN_HEIGHT = love.window.getDesktopDimensions()
SCREEN_WIDTH, SCREEN_HEIGHT = SCREEN_WIDTH * 0.8, SCREEN_HEIGHT * 0.8

VIRTUAL_WIDTH, VIRTUAL_HEIGHT = 790, 530
-- readd 320, 240 back to the virtual height when camera is ready to work 790, 640

function love.load()

  -- libraries
  sti = require('libraries.sti')
  gameMap = sti('maps/gameMap.lua')
  push = require('libraries.push-master.push')
  anim8 = require('libraries/anim8')
  love.graphics.setDefaultFilter("nearest", "nearest")
  camera = require('libraries.camera')
  cam = camera()

  -- windfield physics 
  wf = require('libraries/windfield')
  world = wf.newWorld(0,0, true)
  world:setGravity(0, 10000)
  world:addCollisionClass("Solid")


  -- importing modules
  player = require('/modules/player')
  walls = require('/modules/walls')


  --push setup for fullscreen game
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

  cam:lookAt(500, 500) -- 400, 300

  local mapW = gameMap.width * gameMap.tilewidth
  local mapH = gameMap.height * gameMap.tileheight

  -- limit camera to game map
  local w = love.graphics.getWidth()
  local h = love.graphics.getHeight()

  -- right border
  if cam.x > (mapW - w/2) then
    cam.x = (mapW - w/2)
  end
  -- bottom border
  if cam.y > (mapH - h/2) then
    cam.y = (mapH - h/2)
  end


end

function love.resize(w,h)
  push:resize(w,h)
end

function love.draw()
 
  push:start()
  cam:attach()
    -- gameMap:drawLayer(gameMap.layers["Platforms"])
    -- gameMap:drawLayer(gameMap.layers["Background"])
    gameMap:draw()


    local spriteWidth = 32 * 2
    local spriteHeight = 32 * 2
    local offsetX = player.scaleX < 0 and spriteWidth or 0
    player.anim:draw(player.spriteSheet, player.x + offsetX - spriteWidth / 2, player.y - spriteHeight / 2, 0,player.scaleX, 2)
    --player.anim:draw(player.spriteSheet, player.x, player.y)
    cam:detach()

    world:draw()
    push:finish()
   
end