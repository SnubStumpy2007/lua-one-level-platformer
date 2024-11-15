local player = {}
player.x = 100
player.y = 300
player.speed = 350
player.spriteSheet = love.graphics.newImage('/sprites/guido.png') --kelvinshadewing.net.
player.collider = world:newBSGRectangleCollider(100, 300, 40, 80, 10) -- 430
player.collider:setFixedRotation(true)
player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
player.scaleX = 2
playerCanJump = true



player.animations = {}
player.animations.walk = anim8.newAnimation(player.grid('1-8', 2), 0.2)

player.anim = player.animations.walk

return player