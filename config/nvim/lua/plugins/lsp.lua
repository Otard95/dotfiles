function SetupLsp()
  local lsp = require 'lsp-zero'
  local cmp = require 'cmp'
  -- local lspconfig = require 'lspconfig'

  lsp.preset('recommended')

  require 'mason'.setup {}
  require 'mason-lspconfig'.setup {
    automatic_installation = true,
    ensure_installed = {
      'tsserver',
      'eslint',
      'intelephense',
      'rust_analyzer',
      'lua_ls',
    },
    handlers = {
      lsp.default_setup,
      lua_ls = function ()
        require 'lspconfig'.lua_ls.setup {
          on_init = function (client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
              client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                  runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                  },
                  -- Make the server aware of Neovim runtime files
                  workspace = {
                    checkThirdParty = false,
                    -- library = {
                    --   vim.env.VIMRUNTIME
                    --   -- "${3rd}/luv/library"
                    --   -- "${3rd}/busted/library",
                    -- }
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                    library = vim.api.nvim_get_runtime_file("", true)
                  }
                }
              })

              client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end
            return true
          end
        }
      end,
      eslint = function()
        require 'lspconfig'.eslint.setup {
          setting = {
            packageManager = 'pnpm',
          },
        }
      end
    },
  }

  require 'lspconfig'.typos_lsp.setup {}

  local cmp_action = lsp.cmp_action()
  cmp.setup {
    mapping = cmp.mapping.preset.insert({
      -- `Enter` key to confirm completion
      -- ['<CR>'] = cmp.mapping.confirm({select = false}),

      -- `Ctrl+j/k` to move select next/prev item in the completion menu
      -- ['<C-j>'] = cmp.mapping.select_next_item(),
      -- ['<C-k>'] = cmp.mapping.select_prev_item(),

      -- Ctrl+Space to trigger completion menu
      ['<C-Space>'] = cmp.mapping.complete(),

      -- Navigate between snippet placeholder
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),

      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
  }

  lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  end)

  lsp.setup()

  vim.diagnostic.config({
    virtual_text = true
  })
end

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
  },
  config = SetupLsp,
}
