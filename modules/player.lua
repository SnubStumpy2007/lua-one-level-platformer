local player = {}
player.x = 100
player.y = 650
player.speed = 3
player.spriteSheet = love.graphics.newImage('/sprites/guido.png') --kelvinshadewing.net.
player.collider = world:newBSGRectangleCollider(100, 650, 40, 80, 10)
player.collider:setFixedRotation(true)
player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())



player.animations = {}
player.animations.right = anim8.newAnimation(player.grid('1-8', 2), 0.2)
player.animations.left = anim8.newAnimation(player.grid('1-8', 2), 0.2)

player.anim = player.animations.right

return player