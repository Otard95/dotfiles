function SetupLsp()
  local cmp = require 'cmp'
  local lspconfig = require 'lspconfig'

  require 'fidget'.setup {}

  local default_capabilities = vim.tbl_deep_extend(
    'force',
    {},
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
  )
  local default_handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
  }
  local function default_setup(server_name)
    lspconfig[server_name].setup {
      capabilities = default_capabilities,
      handlers = default_handlers,
    }
  end

  require 'mason-lspconfig'.setup {
    automatic_installation = true,
    ensure_installed = {
      'tsserver',
      'eslint',
      'jsonls',
      'intelephense',
      'rust_analyzer',
      'lua_ls',
    },
    handlers = {
      default_setup,
      eslint = function()
        require 'lspconfig'.eslint.setup {
          capabilities = default_capabilities,
          handlers = default_handlers,
          setting = {
            packageManager = 'pnpm',
          },
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        }
      end,
      intelephense = function()
        require 'lspconfig'.intelephense.setup {
          capabilities = default_capabilities,
          handlers = default_handlers,
          settings = {
            intelephense = {
              phpVersion = '8.2',
            },
          },
        }
      end,
      lua_ls = function()
        require 'lspconfig'.lua_ls.setup {
          capabilities = default_capabilities,
          handlers = default_handlers,
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                library = {
                  vim.env.VIMRUNTIME,
                }
              },
            },
          },
        }
      end,
    },
  }

  require 'lspconfig'.typos_lsp.setup {}

  cmp.setup {
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    }),
    mapping = cmp.mapping.preset.insert({
      -- `Tab` key to confirm completion
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),

      -- `Ctrl+j/k` to move select next/prev item in the completion menu
      -- ['<C-j>'] = cmp.mapping.select_next_item(),
      -- ['<C-k>'] = cmp.mapping.select_prev_item(),

      -- Ctrl+Space to trigger completion menu
      ['<C-Space>'] = cmp.mapping.complete(),

      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
  }

  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      local opts = { buffer = event.buf }

      vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
      vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set('n', '<leader>lws', function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set('n', '<leader>lca', function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set('n', '<leader>lrr', function() vim.lsp.buf.references() end, opts)
      vim.keymap.set('n', '<leader>lrn', function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
  })

  -- Set borders for lspconfig windows
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "lspinfo",
    callback = function()
      vim.api.nvim_win_set_config(0, { border = "rounded" })
    end,
  })

  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    float = { border = 'rounded' },
    virtual_text = true
  })
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Support
      { 'williamboman/mason.nvim',          opts = { ui = { border = 'rounded' } } },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },

      -- Other
      { 'j-hui/fidget.nvim' },
    },
    config = SetupLsp,
  },
  {
    'OlegGulevskyy/better-ts-errors.nvim',
    config = {
      keymaps = {
        toggle = '<leader>dd',           -- Toggling keymap
        go_to_definition = '<leader>dx', -- Go to problematic type from popup window
      }
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
}
