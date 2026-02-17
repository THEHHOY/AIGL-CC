local uilib = require("uilib")
local element = require("uilib.elements.button")

local ui = uilib:newUI(term.current())

ui:addElement(element:new({
    x = 5,
    y = 5,
    w = 15,
    h = 7,
    bg = colors.gray,
    fg = colors.white,
    text = "Hello"
}),"element")

while true do
    ui:render()
    local ev = {os.pullEvent()}
    ui:handleEvent(ev)
    for i,a in ipairs(ui:getEvents()) do
        if a.type == "button_press" then
            error("BUTTON IS PRESSED",0)
        end
    end
end