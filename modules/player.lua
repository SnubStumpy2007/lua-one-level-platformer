local player = {}
player.x = 100
player.y = 450
player.speed = 5
player.sprite = love.graphics.newImage('/sprites/SoccerBall.png')
player.collider = world:newCircleCollider(100, 450, 13)

return player