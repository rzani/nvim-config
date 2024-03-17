local map = vim.keymap.set
local opts = {noremap = true}

-- Escape alternatives
map('i', 'jj', '<esc>')
map('i', 'kk', '<esc>')
map('i', '<C-f>', '<Right>')
map('i', '<C-b>', '<Left>')

-- Closing Buffer
map('n', '<leader>q', ':bp <BAR> bd! #<CR>')

-- Switching between buffers
map('n', ',.', '<C-^><CR>')

-- Moving lines arround in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Remove Hightligh from search
map("n", ",<Space>", ":nohlsearch<CR>")




-- Floating Terminal
--map('n', '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>')
--map('t', '<C-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')


-- NvimTree
--map('n', '-', ':NvimTreeToggle <CR>')

--function P.map_java_keys(bufnr)
    --map_lsp_keys()
    --local spring_boot_run = 'mvn spring-boot:run'---Dspring-boot.run.profiles=local'
    --local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
    --map('n', '<leader>sr', command)
    --map('n', '<leader>oi', ':lua require("jdtls").organize_imports()<CR>')
    --map('n', '<leader>jc', ':lua require("jdtls).compile("incremental") ' )
--end


