-- CUSTOM Logitech Marble Mouse Nauutilus
local leftAuxMouseButton = 3
local rightAuxMouseButton = 4
local middleMouseButton = 2
local shiftKeyPressed = false
local ctrlKeyPressed = false
local cmdKeyPressed = false
local altKeyPressed = false

overrideFlagsChange = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(e)

    local pressedKeyCode = e:getKeyCode()

    if pressedKeyCode == hs.keycodes.map["shift"] then
        shiftKeyPressed = not shiftKeyPressed
    end

    if pressedKeyCode == hs.keycodes.map["alt"] then
        altKeyPressed = not altKeyPressed
    end

    if pressedKeyCode == hs.keycodes.map["ctrl"] then
        ctrlKeyPressed = not ctrlKeyPressed
    end

    if pressedKeyCode == hs.keycodes.map["cmd"] then
        cmdKeyPressed = not cmdKeyPressed
    end

    return false
end)

overrideOtherMouseDown = hs.eventtap.new({hs.eventtap.event.types.otherMouseDown}, function(e)
    local pressedMouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])

    if leftAuxMouseButton == pressedMouseButton then
        return true
    end

    if (rightAuxMouseButton == pressedMouseButton and shiftKeyPressed) then

        local middleMouseDown = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseDown, e:location(),
                                    {"shift"}):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                    middleMouseButton)
        return true, {middleMouseDown}
    end

    if (rightAuxMouseButton == pressedMouseButton and ctrlKeyPressed) then

        local middleMouseDown = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseDown, e:location(),
                                    {"ctrl"}):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                    middleMouseButton)
        return true, {middleMouseDown}
    end

    if (rightAuxMouseButton == pressedMouseButton and altKeyPressed) then

        local middleMouseDown = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseDown, e:location(),
                                    {"alt"}):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                    middleMouseButton)
        return true, {middleMouseDown}
    end

    if (rightAuxMouseButton == pressedMouseButton and cmdKeyPressed) then

        local middleMouseDown = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseDown, e:location(),
                                    {"cmd"}):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                    middleMouseButton)
        return true, {middleMouseDown}
    end

    if rightAuxMouseButton == pressedMouseButton then
        local middleMouseDown =
            hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseDown, e:location()):setProperty(
                hs.eventtap.event.properties.mouseEventButtonNumber, middleMouseButton)
        return true, {middleMouseDown}

    end

    return false

end)

overrideOtherMouseUp = hs.eventtap.new({hs.eventtap.event.types.otherMouseUp}, function(e)
    local pressedMouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])

    if leftAuxMouseButton == pressedMouseButton then
        return true
    end

    if (rightAuxMouseButton == pressedMouseButton and shiftKeyPressed) then

        local middleMouseUp = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseUp, e:location(),
                                  {"shift"}):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                  middleMouseButton)
        return true, {middleMouseUp}
    end

    if (rightAuxMouseButton == pressedMouseButton and ctrlKeyPressed) then

        local middleMouseUp = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseUp, e:location(),
                                  {"ctrl"}):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                  middleMouseButton)
        return true, {middleMouseUp}
    end

    if (rightAuxMouseButton == pressedMouseButton and altKeyPressed) then

        local middleMouseUp = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseUp, e:location(),
                                  {"alt"}):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                  middleMouseButton)
        return true, {middleMouseUp}
    end

    if (rightAuxMouseButton == pressedMouseButton and cmdKeyPressed) then

        local middleMouseUp = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseUp, e:location(),
                                  {"cmd"}):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                  middleMouseButton)
        return true, {middleMouseUp}
    end

    if rightAuxMouseButton == pressedMouseButton then

        local middleMouseUp =
            hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseUp, e:location()):setProperty(
                hs.eventtap.event.properties.mouseEventButtonNumber, middleMouseButton)
        return true, {middleMouseUp}
    end

    return false

end)

local oldmousepos = {}
local scrollmult = -4 -- negative multiplier makes mouse work like traditional scrollwheel

dragOtherToScroll = hs.eventtap.new({hs.eventtap.event.types.otherMouseDragged}, function(e)

    local pressedMouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])

    if (leftAuxMouseButton == pressedMouseButton and ctrlKeyPressed) then


        oldmousepos = hs.mouse.getAbsolutePosition()
        local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
        local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
        local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult}, {"ctrl"}, 'pixel')
        -- put the mouse back
        hs.mouse.setAbsolutePosition(oldmousepos)
        return true, {scroll}
    end

    if (leftAuxMouseButton == pressedMouseButton and shiftKeyPressed) then

        oldmousepos = hs.mouse.getAbsolutePosition()
        local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
        local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
        local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult}, {"shift"}, 'pixel')
        -- put the mouse back
        hs.mouse.setAbsolutePosition(oldmousepos)
        return true, {scroll}
    end

    if (leftAuxMouseButton == pressedMouseButton and altKeyPressed) then

        oldmousepos = hs.mouse.getAbsolutePosition()
        local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
        local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
        local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult}, {"alt"}, 'pixel')
        -- put the mouse back
        hs.mouse.setAbsolutePosition(oldmousepos)
        return true, {scroll}
    end

    if (leftAuxMouseButton == pressedMouseButton and cmdKeyPressed) then

        oldmousepos = hs.mouse.getAbsolutePosition()
        local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
        local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
        local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult}, {"cmd"}, 'pixel')
        -- put the mouse back
        hs.mouse.setAbsolutePosition(oldmousepos)
        return true, {scroll}
    end

    if leftAuxMouseButton == pressedMouseButton then

        oldmousepos = hs.mouse.getAbsolutePosition()
        local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
        local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
        local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult}, {}, 'pixel')
        -- put the mouse back
        hs.mouse.setAbsolutePosition(oldmousepos)
        return true, {scroll}
    end

    if rightAuxMouseButton == pressedMouseButton then

        local otherMouseDragged = hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.otherMouseDragged,
                                      e:location()):setProperty(hs.eventtap.event.properties.mouseEventButtonNumber,
                                      middleMouseButton)
        return true, {otherMouseDragged}

    end

    if middleMouseButton == pressedMouseButton then
        return false
    end
end)

overrideFlagsChange:start()
overrideOtherMouseDown:start()
overrideOtherMouseUp:start()
dragOtherToScroll:start()
