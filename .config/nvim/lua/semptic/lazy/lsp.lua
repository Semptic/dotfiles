return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- "zbirenbaum/copilot-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
      "onsails/lspkind.nvim",
    },

    config = function()
      local lspconfig = require("lspconfig")
      local cmp = require('cmp')

      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      require("fidget").setup({})

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "htmx",
          "tailwindcss",
          "lua_ls",
          "rust_analyzer",
          "tsserver",
          "gopls",
          "templ"
        },

        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                  }
                }
              }
            }
          end,
        }

      })

      vim.filetype.add({ extension = { templ = "templ" } })
      lspconfig.html.setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })
      lspconfig.htmx.setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })
      lspconfig.tailwindcss.setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        init_options = { userLanguages = { templ = "html" } },
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local lspkind = require('lspkind')
      lspkind.init({
        symbol_map = {
          Copilot = "",
        }
      })

      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function(entry, vim_item)
            --   return vim_item
            -- end
          })
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes,
            cmp.config.compare.exact,
            -- require("copilot_cmp.comparators").prioritize,
            cmp.config.compare.score,

            cmp.config.compare.recently_used,
            cmp.config.compare.locality,

            cmp.config.compare.kind,
            cmp.config.compare.sort_text,

            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        sources = cmp.config.sources({
          -- { name = 'copilot',  group_index = 1 },
          { name = 'nvim_lsp', group_index = 2 },
          { name = 'luasnip',  group_index = 2 },
          { name = 'buffer',   group_index = 2 },
        }),
        experimental = {
          ghost_text = true,
        },
      })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end
  }
}
