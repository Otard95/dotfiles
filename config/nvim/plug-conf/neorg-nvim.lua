function NeorgSetup()
  require'neorg'.setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.journal"] = {
        config = {
          journal_folder = 'dailes',
          strategy = 'nested',
          template_name = 'daily_template.norg',
          use_template = true,
          workspace = 'work',
        }
      },
      ["core.concealer"] = {
        config = {
          icons = {
            todo = {
              done = {
                icon = ''
              },
              pending = {
                icon = ''
              },
            },
          },
        },
      }, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            work = "~/dev/smb/neorg/work",
          },
          default_workspace = "work",
        },
      },
      ["core.export"] = {},
      ["core.export.markdown"] = {},
    },
  }
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'TreesitterSetupDone',
  callback = NeorgSetup
})

function neorg_init(paqInit)
  table.insert(paqInit, { 'nvim-neorg/neorg', build = function () vim.cmd 'Neorg sync-parsers' end })
  table.insert(paqInit, 'nvim-lua/plenary.nvim')
end

return neorg_init
