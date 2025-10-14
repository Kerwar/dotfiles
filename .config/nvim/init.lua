require("config.options")

local color = require("defaulters")
color.setup()

require("config.lazy")
require("config.keymaps")
require("config.commands")
require("lsp")
