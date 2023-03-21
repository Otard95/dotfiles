function NeorgSetup()
  require'neorg'.setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.norg.journal"] = {
        config = {
          journal_folder = 'dailes',
          strategy = 'nested',
          template_name = 'daily_template',
          use_template = true,
          workspace = 'work',
        }
      },
      ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.norg.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
            work = "~/smb/neorg/work",
          },
          default_workspace = "work",
        },
      },
    },
  }
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'TreesitterSetupDone',
  callback = NeorgSetup
})

function neorg_init(paqInit)
  table.insert(paqInit, { 'nvim-neorg/neorg', run = function () vim.cmd 'Neorg sync-parsers' end })
  table.insert(paqInit, 'nvim-lua/plenary.nvim')
end

return neorg_init
