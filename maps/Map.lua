Map = {}
Map.__index = Map

function Map:New(data, width, height)
    local this = {
        tiles = data,
        width = width,
        height = height,
        cellSize = 64
    }
    --setmetatable(this,setfenv)
    return this
end

function Map:Render()

end
