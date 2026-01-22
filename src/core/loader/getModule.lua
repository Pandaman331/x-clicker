local modulePaths = {

}

return function(required)
  local results = {}

  for _, name in ipairs(required) do
    local selectedModulePath = modulePaths[name]
    if selectedModulePath then
      results[name] = require(selectedModulePath)
    else
      print("[FATAL]  Module not found: " .. name)
    end
  end

  return results
end
