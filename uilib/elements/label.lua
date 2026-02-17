local element = require("uilib.elements.element")
local label__index = setmetatable({}, element)
local label = {__index=label__index}

function label:new(p)
    local obj = element.new(self,p.x,p.y,p.w,p.h,p.bg)
    obj.properties.text = p.text
    obj.properties.fg = p.fg
    return obj
end

function label__index:render()
    local p = self.properties
    element.__index.render(self)
    term.setCursorPos(p.x+(p.w/2-#p.text/2),p.y+(p.h/2))
    term.setTextColor(p.fg)
    term.write(p.text)
end

return label