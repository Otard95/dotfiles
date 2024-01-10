function SetupHarpoon()
  local harpoon = require 'harpoon'

  harpoon:setup()

  local conf = require("telescope.config").values
  local function toggle_quick_menu()
    local file_paths = {}
    for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
  end

  vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
  -- vim.keymap.set("n", "<leader>he", toggle_quick_menu)
  vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end)
  vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end)
  vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end)
  vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end)
  vim.keymap.set("n", "<leader>h;", function() harpoon:list():select(5) end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
  vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
end

return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    config = SetupHarpoon,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    }
  }
}
