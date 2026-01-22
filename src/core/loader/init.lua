local loader = {}

function loader.init()
  loader.update = require("src.core.loader.update")
  loader.draw = require("src.core.loader.draw")
  loader.getModule = require("src.core.loader.getModule")

  print("[SUCCESS]  Initialized base modules.")
end

return loader
