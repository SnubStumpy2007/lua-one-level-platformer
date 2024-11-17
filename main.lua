
function love.load()

  -- libraries
  sti = require('libraries.sti')
  gameMap = sti('maps/gameMap.lua')
  push = require('libraries.push-master.push')
  anim8 = require('libraries/anim8')
  love.graphics.setDefaultFilter("nearest", "nearest")
  gamera = require('libraries.gamera')


  -- gamera.lua
   cam = gamera.new(0, 0, 800, 590) -- 800, 590, 1024, 640

  -- windfield physics 
  wf = require('libraries/windfield')
  world = wf.newWorld(0,0, true)
  world:setGravity(0, 10000)
  world:addCollisionClass("Solid")


  -- importing modules
  player = require('/modules/player')
  walls = require('/modules/walls')

end

function love.update(dt)

  local isMoving = false
  local vx = 0
  local vy = 0

  -- player moviement
  if love.keyboard.isDown("d") then
    vx = player.speed
     player.anim = player.animations.right
    player.scaleX = 2
    isMoving = true
  elseif love.keyboard.isDown("a") then
    vx = - player.speed
    player.anim = player.animations.left
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


 -- gamera
    cam:setPosition(player.x, player.y)


end

function love.draw()
 
    local function drawCameraStuff()
      gameMap:draw()
      -- local spriteWidth = 32 * 2
      -- local spriteHeight = 32 * 2
      -- local offsetX = player.scaleX < 0 and spriteWidth or 0
      -- player.anim:draw(player.spriteSheet, player.x + offsetX - spriteWidth / 2, player.y - spriteHeight / 2, 0,player.scaleX, 2)
      player.anim:draw(player.spriteSheet, player.x, player.y)

    end
    cam:draw(drawCameraStuff)

    world:draw()

end