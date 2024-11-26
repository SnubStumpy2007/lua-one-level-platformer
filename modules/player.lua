local player = {}
player.x = 100
player.y = 300
player.speed = 550
player.jumpVel = 1500
player.yvel = 0
player.jumpHeight = 300
player.spriteSheet = love.graphics.newImage('/sprites/guido.png') --kelvinshadewing.net.
player.collider = world:newBSGRectangleCollider(100, 300, 40, 70, 10) -- 430
player.collider:setFixedRotation(true)
player.collider:setCollisionClass("Player")
player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
player.scaleX = 2
playerCanJump = true





player.animations = {}
player.animations.stand = anim8.newAnimation(player.grid('1-4', 1), 0.2)
player.animations.right = anim8.newAnimation(player.grid('1-4', 2), 0.2)
player.animations.left = anim8.newAnimation(player.grid('1-4', 1), 0.2)
player.animations.jump = anim8.newAnimation(player.grid('5-6', 1), 0.2)

player.anim = player.animations.stand



return player