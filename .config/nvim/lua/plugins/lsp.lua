return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    -- Enable the following language servers
    local servers = { 
      'clangd', 
      -- 'lua_ls', 
      'pyright' 
    }

    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    for _, lsp in ipairs(servers) do
      require('lspconfig')[lsp].setup {
        capabilities = capabilities,
      }
    end

    -- Customize settings for specific language servers
    -- require'lspconfig'.lua_ls.setup {
      --   on_init = function(client)
        --     local path = client.workspace_folders[1].name
        --     if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
        --       return
        --     end
        --
        --     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          --       runtime = {
            --         -- Tell the language server which version of Lua you're using
            --         -- (most likely LuaJIT in the case of Neovim)
            --         version = 'LuaJIT'
            --       },
            --       -- Make the server aware of Neovim runtime files
            --       workspace = {
              --         checkThirdParty = false,
              --         library = {
                --           vim.env.VIMRUNTIME
                --           -- Depending on the usage, you might want to add additional paths here.
                --           -- "${3rd}/luv/library"
                --           -- "${3rd}/busted/library",
                --         }
                --         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                --         -- library = vim.api.nvim_get_runtime_file("", true)
                --       }
                --     })
                --   end,
                --   settings = {
                  --     Lua = {}
                  --   }
                  -- }
                  -- Configure the fidget plugin for status updates
                  require('fidget').setup()

                  -- Configure the neodev plugin for enhanced Lua development
                  require('neodev').setup()

                  -- Additional LSP configuration and keybindings can be added here
                end,
              }
