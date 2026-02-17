local element__index = {}
local element = {__index = element__index}

function element:new(x,y,w,h,bg)
    local obj = setmetatable({},self)
    obj.properties = {
        x = x,
        y = y,
        w = w,
        h = h,
        bg = bg,
    }
    return obj
end

function element__index:render()
    local p = self.properties
    paintutils.drawFilledBox(p.x,p.y,p.x+p.w,p.y+p.h,p.bg)
end

return element