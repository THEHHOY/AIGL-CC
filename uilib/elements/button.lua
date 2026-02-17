local label = require("uilib.elements.label")
local button__index = setmetatable({},label)
local button = {__index=button__index}

function button:new(arg)
    local obj = label.new(self,arg)
    return obj
end

function button__index:handleEvent(ev,ui)
    local p = self.properties
    if ev[1] == "mouse_click" then
        local mx = ev[3]
        local my = ev[4]
        local x,y,w,h = p.x,p.y,p.w,p.h;
        if (mx>=x and mx<=x+w) and (my>=p.y and my<=y+h) then
            table.insert(ui.events,{
                type = "button_press",
                id = self.id,
                mouse = ev[2]
            })
        end
    end
end

return button