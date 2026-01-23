return function()
  -- print("[OK INIT.draw]\nsrc/core/loader/init/draw.lua\nDraw function started.")
  local stateManager = Loader.getModule({ "stateManager" })
  if stateManager and stateManager.currentState and stateManager.currentState.draw then
    stateManager.currentState.draw()
  end
end
