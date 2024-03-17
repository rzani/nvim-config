
local spring_boot_run = 'mvn spring-boot:run'---Dspring-boot.run.profiles=local'
local command = ':terminal ' .. spring_boot_run .. ' <CR>'

--vim.keymap.set('n', '<leader>ar', command)
--vim.keymap.set('n', '<leader>oi', ':lua require("jdtls").organize_imports()<CR>')
--vim.keymap.set('n', '<leader>jc', ':lua require("jdtls).compile("incremental") ' )
