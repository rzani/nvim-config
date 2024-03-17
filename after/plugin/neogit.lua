local neogit = require('neogit')
local gs = require('gitsigns')
local wk = require("which-key")

neogit.setup()

wk.register({
  g = {
    name = "git", -- optional group name
    b = { function() gs.blame_line{full=true} end, "blame current line" },
    B = { gs.toggle_current_line_blame, "toggle current line blame" },
    g = { neogit.open, "status page" },
    s = { gs.stage_buffer, "stage current buffer" },
    S = { gs.undo_stage_hunk, "undo stage hunk" }
  },
}, { 
    prefix = "<leader>",
    mode = "n"
})
