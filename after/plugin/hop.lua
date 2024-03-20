local hop = require('hop')
local wk = require("which-key")

hop.setup()

local directions = require('hop.hint').HintDirection

wk.register({
  ["<space>"] = { name = "+hop" },
  ["<space><space>"] = { ':HopPattern <CR>', "Hop jump" }
}, { 
    mode = "n"
})

--map('n', '<Space>f', function()
  --hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
--end, {remap=true})

--map('n', '<Space>F', function()
  --hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
--end, {remap=true})
--
--map('n', '<Space><Space>', ':HopPattern <CR>')
