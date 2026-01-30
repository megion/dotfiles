vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil then
      return
    end

    -- Disable semantic highlights
    client.server_capabilities.semanticTokensProvider = nil

    local opts = { buffer = event.buf }
    local builtin = require("telescope.builtin")
    -- vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
    -- vim.keymap.set("n", "gr", builtin.lsp_references, opts)

    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
    vim.keymap.set("n", "fi", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gs", builtin.lsp_workspace_symbols, opts)
    -- vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    -- vim.keymap.set(
    --   { "n", "x" },
    --   "=",
    --   "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
    --   opts
    -- )
    -- vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
    -- vim.keymap.set(
    --   "n",
    --   "g]",
    --   "<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>",
    --   opts
    -- )
    -- vim.keymap.set(
    --   "n",
    --   "g[",
    --   "<cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>",
    --   opts
    -- )
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  -- pattern = { "java", "groovy" },
  callback = function(args)
    require("jdtls.jdtls_setup").setup()
  end,
})

-- vim.api.nvim_create_autocmd({ "BufReadPre", "BufWritePost" }, {
--   callback = function()
--     local lint_progress = function()
--       local linters = require("lint").get_running()
--       if #linters == 0 then
--         return "󰦕"
--       end
--       return "󱉶 " .. table.concat(linters, ", ")
--     end
--     -- print("------1")
--     -- print("try lint")
--
--     -- print(require('lint').linters.checkstyle.config_file)
--
--     -- try_lint without arguments runs the linters defined in `linters_by_ft`
--     -- for the current filetype
--     require("lint").try_lint("checkstyle")
--     -- print(lint_progress())
--
--     -- You can call `try_lint` with a linter name or a list of names to always
--     -- run specific linters, independent of the `linters_by_ft` configuration
--     -- require("lint").try_lint("cspell")
--   end,
-- })

-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("ts_ls")
-- vim.lsp.enable("jdtls")
-- vim.lsp.enable("groovyls")
-- vim.lsp.enable('luals')
--
-- vim.lsp.config("groovyls", {
--   -- Unix
--   cmd = {
--     "java",
--     "-jar",
--     "/home/ilya/workspaces/java/groovy-language-server/build/libs/groovy-language-server-all.jar",
--   },
-- })

-- vim.lsp.config("gradle_ls", {
--   -- Unix
--   cmd = {
--     "/home/ilya/workspaces/lua/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server",
--   },
--   filetypes = { "gradle", "groovy" },
-- })
-- vim.lsp.enable('gradle_ls')
