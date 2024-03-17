local wk = require("which-key")

wk.register({
  ["<space>u"] = { vim.cmd.UndotreeToggle, "undo tree" }
}, { 
    mode = "n"
})
