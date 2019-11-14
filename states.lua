local states = {}
states.states = {}
states.currentState = ""

function states.init(statetable, startState)
  for k, v in pairs(statetable) do
    if not states.states[v._NAME] then
      states.states[v._NAME] = v
    end
  end
  if startState then
    states.setState(startState, true)
  end
end

function states.setState(name, loadBool)
   if states.states[name] then
      states.currentState = name
      if loadBool then states.load(states.currentState) else end
      print("set state to " .. states.currentState)
   end
end

function states.load(name)
   if states.states[name] then
      states.states[name]:load()
   end
end

function states.draw()
   if states.currentState ~= "" then
      if states.states[states.currentState].draw then
         states.states[states.currentState]:draw()
      end
   end
end

function states.update(dt)
   if states.currentState ~= "" then
      if states.states[states.currentState].update then
         states.states[states.currentState]:update(dt)
      end
   end
end

function states.mousepressed(x, y, button, istouch, presses)
   if states.currentState ~= "" then
      if states.states[states.currentState].mousepressed then
         states.states[states.currentState]:mousepressed(x, y, button, istouch, presses)
      end
   end
end

function states.mousereleased(x, y, button, istouch, presses)
   if states.currentState ~= "" then
      if states.states[states.currentState].mousereleased then
         states.states[states.currentState]:mousereleased(x, y, button, istouch, presses)
      end
   end
end

function states.wheelmoved(x, y)
   if states.currentState ~= "" then
      if states.states[states.currentState].wheelmoved then
         states.states[states.currentState]:wheelmoved(x, y)
      end
   end
end

function states.keypressed(key, scancode, isrepeat)
   if states.currentState ~= "" then
      if states.states[states.currentState].keypressed then
         states.states[states.currentState]:keypressed(key, scancode, isrepeat)
      end
   end
end

function states.keyreleased(key, scancode, isrepeat)
   if states.currentState ~= "" then
      if states.states[states.currentState].keyreleased then
         states.states[states.currentState]:keyreleased(key, scancode, isrepeat)
      end
   end
end

return states
