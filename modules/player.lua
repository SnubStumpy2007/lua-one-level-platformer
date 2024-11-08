local player = {}
player.x = 100
player.y = 450
player.speed = 5
player.spriteSheet = love.graphics.newImage('/sprites/guido.png') --kelvinshadewing.net.
player.collider = world:newCircleCollider(100, 450, 13)
player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())


player.animations = {}
player.animations.right = anim8.newAnimation(player.grid('1-5', 1), 0.2)
player.animations.left = anim8.newAnimation(player.grid('1-8', 2), 0.2)

return player