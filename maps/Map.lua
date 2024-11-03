Map = {}
Map.__index = Map

function Map:New(data, width, height)
    local this = {
        tiles = data,
        width = width,
        height = height,
        cellSize = 64
    }
    setmetatable(this,self)
    return this
end

function Map:Render()
    for row = 0, self.height do
        for col = 0, self.width -1 do
            local sx = col * self.cellSize
            local sy = row * self.cellSize
            local tile = self.tiles[row * self.width + col]
            love.graphics.rectangle("line", sx, sy, self.cellSize, self.cellSize)
        end
    end
end
