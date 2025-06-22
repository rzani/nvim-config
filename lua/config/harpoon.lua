local harpoon = require("harpoon")
local conf = require("telescope.config").values
local wk = require("which-key")

harpoon:setup({})

local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

-- stylua: ignore
wk.add({
  { "<leader>ha", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Quick Menu" },
	{ "<leader>hx", function() harpoon:list():add() end, desc = "Add Mark" },
	{ "<leader>hl", function() toggle_telescope(harpoon:list()) end, desc = "List" },
})
