--------------------------------------------------------------------------------
-- This class stores data in the form of map tiles. <br>
-- Applies to the Model class. <br>
-- <br>
-- Display function is not held. <br>
-- Use the TMXMapView. <br>
-- <br>
-- For tile map editor, please see below. <br>
-- http://www.mapeditor.org/ <br>
-- @class table
-- @name TMXMap
--------------------------------------------------------------------------------

local class = require("hp/lang/class")
local table = require("hp/lang/table")

local M = class()

-- constraints
M.ATTRIBUTE_NAMES = {
    "version", "orientation", "width", "height", "tilewidth", "tileheight"
}

--------------------------------------------------------------------------------
-- The constructor.
--------------------------------------------------------------------------------
function M:init()
    self.version = 0
    self.orientation = ""
    self.width = 0
    self.height = 0
    self.tilewidth = 0
    self.tileheight = 0
    self.layers = {}
    self.tilesets = {}
    self.objectGroups = {}
    self.properties = {}
end

--------------------------------------------------------------------------------
-- The information on the standard output TMXMap.
--------------------------------------------------------------------------------
function M:printDebug()
    -- header
    print("<TMXMap>")
    
    -- attributes
    for i, attr in ipairs(self.ATTRIBUTE_NAMES) do
        local value = self[attr]
        value = value and value or ""
        print(attr .. " = " .. value)
    end
    print("</TMXMap>")

end

--------------------------------------------------------------------------------
-- Add a layer.
-- @param layer layer.
--------------------------------------------------------------------------------
function M:addLayer(layer)
    table.insert(self.layers, layer)
end

--------------------------------------------------------------------------------
-- Remove a layer.
--------------------------------------------------------------------------------
function M:removeLayer(layer)
    return table.removeElement(self.layers, layer)
end

--------------------------------------------------------------------------------
-- Remove a layer.
--------------------------------------------------------------------------------
function M:removeLayerAt(index)
    return table.remove(self.layers, index)
end

--------------------------------------------------------------------------------
-- Finds and returns the layer.
-- @param name Find name.
--------------------------------------------------------------------------------
function M:findLayerByName(name)
    for i, v in ipairs(self.layers) do
        if v.name == name then
            return v
        end
    end
    return nil
end

--------------------------------------------------------------------------------
-- Add the tile set.
-- @param tileset tileset.
--------------------------------------------------------------------------------
function M:addTileset(tileset)
    table.insert(self.tilesets, tileset)
end

--------------------------------------------------------------------------------
-- Remove the tile set.
--------------------------------------------------------------------------------
function M:removeTileset(tileset)
    return table.removeElement(self.tilesets, tileset)
end

--------------------------------------------------------------------------------
-- Remove the tile set.
--------------------------------------------------------------------------------
function M:removeTilesetAt(index)
    return table.remove(self.tilesets, index)
end

--------------------------------------------------------------------------------
-- Finds and returns the tileset from the specified gid.
-- @param gid
-- @return TMXTileset
--------------------------------------------------------------------------------
function M:findTilesetByGid(gid)
    local matchTileset = nil
    for i, tileset in ipairs(self.tilesets) do
        if gid >= tileset.firstgid then
            matchTileset = tileset
        end
    end
    return matchTileset
end

--------------------------------------------------------------------------------
-- Add the ObjectGroup.
--------------------------------------------------------------------------------
function M:addObjectGroup(objectGroup)
    table.insert(self.objectGroups, objectGroup)
end

--------------------------------------------------------------------------------
-- Remove the ObjectGroup.
--------------------------------------------------------------------------------
function M:removeObjectGroup(objectGroup)
    return table.removeElement(self.objectGroups, objectGroup)
end

--------------------------------------------------------------------------------
-- Remove the ObjectGroup.
--------------------------------------------------------------------------------
function M:removeObjectGroupAt(index)
    return table.remove(self.objectGroups, index)
end

--------------------------------------------------------------------------------
-- Returns the property with the specified key.
--------------------------------------------------------------------------------
function M:getProperty(key)
    return self.properties[key]
end

return M