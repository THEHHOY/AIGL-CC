local uilib__index = {}
local uilib = {__index = uilib__index}

function uilib:newUI(t)
    local object = setmetatable({},self)
    object.elements = {}
    object.term = t
    object.events = {}
    t.clear()
    return object
end

function uilib__index:addElement(el,id)
    if not el.properties then error("Theres no properties for element: "..tostring(id),0) end
    el.id = id
    self.elements[id] = el
    return self
end

function uilib__index:handleEvent(ev)
    self.events = {}
    for i,a in pairs(self.elements) do
        if a.handleEvent then
            a:handleEvent(ev,self)
        end
    end
end

function uilib__index:render()
    local oTerm = term.current()
    term.redirect(self.term)
    for i,a in pairs(self.elements) do
        if a.render then
            a:render()
        end
    end
    term.redirect(oTerm)
end

function uilib__index:getEvents()
    return self.events
end

return uilib