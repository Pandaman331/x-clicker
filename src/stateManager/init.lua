local stateManager = {
  currentState = nil,
  preparedState = nil,
}

local statePaths = {
  gameplay = "src.state.gameplay.init"
}

function stateManager.switch(stateName)
  if stateManager.preparedState and stateManager.preparedState == stateName then
    stateManager.currentState = stateManager.preparedState
    stateManager.preparedState = nil
  else
    local path = statePaths[stateName]

    if path then
      local state = require(path)
      stateManager.currentState = state
    end
  end
end

function stateManager.prepareState(stateName)
  local path = statePaths[stateName]

  if path then
    stateManager.preparedState = require(path)
  end
end

return stateManager
