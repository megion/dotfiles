return {
  -- {
  --   "saghen/blink.cmp",
  --   -- optional: provides snippets for the snippet source
  --   dependencies = { "rafamadriz/friendly-snippets" },
  --
  --   -- use a release tag to download pre-built binaries
  --   version = "1.*",
  --   -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  --   -- build = 'cargo build --release',
  --   -- If you use nix, you can build from source using latest nightly rust with:
  --   -- build = 'nix run .#build-plugin',
  --
  --   ---@module 'blink.cmp'
  --   ---@type blink.cmp.Config
  --   opts = {
  --     -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  --     -- 'super-tab' for mappings similar to vscode (tab to accept)
  --     -- 'enter' for enter to accept
  --     -- 'none' for no mappings
  --     --
  --     -- All presets have the following mappings:
  --     -- C-space: Open menu or open docs if already open
  --     -- C-n/C-p or Up/Down: Select next/previous item
  --     -- C-e: Hide menu
  --     -- C-k: Toggle signature help (if signature.enabled = true)
  --     --
  --     -- See :h blink-cmp-config-keymap for defining your own keymap
  --     keymap = { preset = "default" },
  --
  --     appearance = {
  --       -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
  --       -- Adjusts spacing to ensure icons are aligned
  --       nerd_font_variant = "mono",
  --     },
  --
  --     -- (Default) Only show the documentation popup when manually triggered
  --     completion = { documentation = { auto_show = false } },
  --
  --     -- Default list of enabled providers defined so that you can extend it
  --     -- elsewhere in your config, without redefining it, due to `opts_extend`
  --     sources = {
  --       default = { "lsp", "path", "snippets", "buffer" },
  --     },
  --
  --     -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
  --     -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
  --     -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
  --     --
  --     -- See the fuzzy documentation for more information
  --     fuzzy = { implementation = "prefer_rust_with_warning" },
  --   },
  --   opts_extend = { "sources.default" },
  -- },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      -- library = {
      --   -- See the configuration section for more details
      --   -- Load luvit types when the `vim.uv` word is found
      --   { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      -- },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help", -- Adds signatures to cmp
    },
    -- opts = function(_, opts)
    --   opts.sources = opts.sources or {}
    --   table.insert(opts.sources, {
    --     name = "lazydev",
    --     group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    --   })
    -- end,
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api
              .nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match("%s")
            == nil
      end

      local cmp = require("cmp")

      cmp.setup({
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#confirm-candidate-on-tab-immediately-when-theres-only-one-completion-entry
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
              else
                cmp.select_next_item()
              end
            --[[ Replace with your snippet engine (see above sections on this page)
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance() ]]
            elseif has_words_before() then
              cmp.complete()
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
              end
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          -- {
          --   name = "lazydev",
          --   group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          -- },
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" }, -- Displays floating parameter info
          {
            name = "path",
            option = {
              -- Options go into this table
            },
          },
          { name = "vsnip" }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "hrsh7th/cmp-vsnip",
  },
  {
    "hrsh7th/vim-vsnip",
  },
}
