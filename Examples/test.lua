local uilib = require("uilib")
local element = require("uilib.elements.button")
local label = require("uilib.elements.label")

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
            ui:addElement(label:new({
                x = 5,
                y = 15,
                w = 15,
                h = 3,
                bg = colors.black,
                fg = colors.white,
                text = "U pressed the button"
            }),"Label")
        end
    end
end