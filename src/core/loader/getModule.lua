local modulePaths = {
  stateManager = "src.stateManager.init"
}

return function(required)
  local results = {}

  for i, name in ipairs(required) do
    local selectedModulePath = modulePaths[name]
    if not selectedModulePath then
      print("[FATAL]  Module not found: " .. name)
    end

    results[i] = require(selectedModulePath)
  end

  return unpack(results)
end
