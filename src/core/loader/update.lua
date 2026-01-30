return function(dt)
  -- print("[OK INIT.update]\nsrc/core/loader/init/update.lua\nInside update loop.")
  local stateManager = Loader.getModule({ "stateManager" })
  if stateManager and stateManager.currentState and stateManager.currentState.update then
    stateManager.currentState.update()
  end
end
