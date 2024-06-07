return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    { "lukas-reineke/lsp-format.nvim", config = true },
  },
  config = function()
    --> lsp-zero config
    local lsp = require("lsp-zero")
    require('lspconfig').gopls.setup({})
    lsp.preset("recommended")
    lsp.on_attach(function(client, bufnr)
      require("lsp-format").on_attach(client, bufnr)
    end)
    -- lsp.nvim_workspace()
    lsp.setup()
    vim.diagnostic.config { virtual_text = true }

    --> nvim-cmp autocomplete config
    local cmp = require('cmp')
    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      mapping = {
        ['<C-l>'] = cmp.mapping.confirm({select = false}),
        ['<C-h>'] = cmp.mapping.abort(),
        ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        ['<C-p>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item({behavior = 'insert'})
          else
            cmp.complete()
          end
        end),
        ['<C-n>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({behavior = 'insert'})
          else
            cmp.complete()
          end
        end),
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end
}
