local map = vim.keymap.set
local opts = {noremap = true}

-- Escape alternatives
map('i', 'jj', '<esc>')
map('i', 'kk', '<esc>')
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')

-- Closing Buffer
map('n', '<leader>q', ':bp <BAR> bd! #<CR>')

-- NvimTree
map('n', '-', ':NvimTreeToggle <CR>')

-- Moving lines arround in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Remove Hightligh from search
map("n", ",<Space>", ":nohlsearch<CR>")

-- Floating Terminal
map('n', '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<C-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Switching between buffers
map('n', ',.', '<C-^><CR>')


-- ------- --
-- PLUGINS --
-- ------- --



-- GitSigns
-- --------------------
local gs = require('gitsigns')
map('n', '<leader>hs', gs.stage_buffer)
map('n', '<leader>hS', gs.undo_stage_hunk)
map('n', '<leader>hR', gs.reset_buffer)
map('n', '<leader>hp', gs.preview_hunk)
map('n', '<leader>hb', function() gs.blame_line{full=true} end)
map('n', '<leader>tb', gs.toggle_current_line_blame)
map('n', '<leader>hd', gs.diffthis)
map('n', '<leader>hD', function() gs.diffthis('~') end)
map('n', '<leader>td', gs.toggle_deleted)
map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')


-- Hop (easy motion)
-- --------------------
local hop = require('hop')
local directions = require('hop.hint').HintDirection

map('n', '<Space>f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})

map('n', '<Space>F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})

map('n', '<Space><Space>', ':HopPattern <CR>')

--function P.map_java_keys(bufnr)
    --map_lsp_keys()
    local spring_boot_run = 'mvn spring-boot:run'---Dspring-boot.run.profiles=local'
    local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
    map('n', '<leader>sr', command)
    map('n', '<leader>oi', ':lua require("jdtls").organize_imports()<CR>')
    map('n', '<leader>jc', ':lua require("jdtls).compile("incremental") ' )
--end


