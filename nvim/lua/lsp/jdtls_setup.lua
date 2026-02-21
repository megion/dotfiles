local M = {}

function M:setup()
  local jdtls_path = vim.fn.expand("$MASON/packages/jdtls")
  local equinox_launcher_path =
    vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar", 1)
  local config_path = vim.fn.glob(jdtls_path .. "/config_linux")
  local lombok_path = jdtls_path .. "/lombok.jar"

  local root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" })
  -- TODO: case 1: project_name depend on cwd
  -- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  --
  -- TODO: case 2: project_name = root_dir
  local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")

  local data_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name
  -- local workspace_dir = vim.fn.stdpath("data")
  --   .. package.config:sub(1, 1)
  --   .. "jdtls-workspace"
  --   .. package.config:sub(1, 1)
  --   .. project_name

  -- See `:help vim.lsp.start` for an overview of the supported `config` options.
  local config = {
    name = "jdtls",

    -- `cmd` defines the executable to launch eclipse.jdt.ls.
    -- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
    --
    -- As alternative you could also avoid the `jdtls` wrapper and launch
    -- eclipse.jdt.ls via the `java` executable
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line

    -- if use standart jdtls so set JAVA_HOME and JDTLS_JVM_ARGS
    -- export JAVA_HOME="/usr/lib/jvm/java-25-openjdk"
    -- export JDTLS_JVM_ARGS="-javaagent:$HOME/development/lombok-1.18.26.jar"
    -- cmd = {
    --   "jdtls",
    --   "-data",
    --   workspace_dir,
    -- },
    cmd = {
      "/usr/lib/jvm/java-21-openjdk/bin/java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dosgi.checkConfiguration=true",
      "-Dosgi.sharedConfiguration.area=" .. config_path,
      "-Dosgi.sharedConfiguration.area.readOnly=true",
      "-Dosgi.configuration.cascaded=true",
      "-Xms1G",
      -- "-Dlog.protocol=true",
      -- "-Dlog.level=ALL",
      "-Xmx8G",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",
      -- javaagent should be before `-jar`
      "-javaagent:" .. lombok_path,
      "-jar",
      equinox_launcher_path,
      -- "-configuration",
      -- config_path,
      "-data",
      data_dir,
      -- "jdtls",
      -- "-data",
      -- workspace_dir,
    },

    -- `root_dir` must point to the root of your project.
    -- See `:help vim.fs.root`
    root_dir = root_dir,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {
        -- format = {
        --   settings = {
        --     url = "/home/ilya/workspaces/hcs/format.xml",
        --   },
        -- },
        -- sources = {
        --   organizeImports = {
        --     starThreshold = 9999,
        --     staticStarThreshold = 9999,
        --   },
        -- },
        -- configuration = {
        --   runtimes = {
        --     {
        --       name = "JavaSE-21",
        --       path = "/usr/lib/jvm/java-21-openjdk",
        --       default = true,
        --     },
        --     {
        --       name = "JavaSE-17",
        --       path = "/usr/lib/jvm/java-17-openjdk",
        --       -- default = true, -- Set as the default if no project config is found
        --     },
        --   },
        -- },
        import = {
          -- saveActions = {
          --   organizeImports = true,
          -- },
          maven = {
            enabled = true,
          },
          gradle = {
            enabled = true,
          },
        },
        eclipse = {
          downloadSources = true,
        },
        maven = {
          downloadSources = true,
        },
        -- implementationsCodeLens = {
        --   enabled = true,
        -- },
        -- referencesCodeLens = {
        --   enabled = true,
        -- },
        -- inlayHints = {
        --   parameterNames = {
        --     enabled = "all",
        --   },
        -- },
        -- signatureHelp = {
        --   enabled = true,
        -- },
      },
    },

    on_attach = function(client, bufnr)
      -- vim.cmd([[
      --         command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
      --         command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
      --         command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
      --         command! -buffer JdtJol lua require('jdtls').jol()
      --         command! -buffer JdtBytecode lua require('jdtls').javap()
      --         command! -buffer JdtJshell lua require('jdtls').jshell()
      --     ]])

      local jdtls = require("jdtls")
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<leader><leader>o", jdtls.organize_imports, opts)
      -- keymap.set("n", "<leader>dn", ":lua require('jdtls').test_nearest_method()<CR>", opts)
      -- keymap.set("n", "<leader>dc", ":lua require('jdtls').test_class()<CR>", opts)

      vim.api.nvim_create_user_command(
        "JavaOrganizeImports",
        jdtls.organize_imports,
        {}
      )
      -- vim.api.nvim_create_user_command("JavaTestClass", jdtls.test_class, {})
      -- vim.api.nvim_create_user_command(
      --   "JavaTestNearest",
      --   jdtls.test_nearest_method,
      --   {}
      -- )

      -- nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
      -- vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
      -- nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
      -- vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
      -- vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>
    end,

    -- This sets the `initializationOptions` sent to the language server
    -- If you plan on using additional eclipse.jdt.ls plugins like java-debug
    -- you'll need to set the `bundles`
    --
    -- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on any eclipse.jdt.ls plugins you can remove this
    init_options = {
      bundles = {},
    },
  }
  -- debug logs:
  -- print("Starting jdtls ...")
  -- print("root_dir: ", root_dir)
  -- print("data_dir ", data_dir)
  -- print(table.concat(config.cmd, " "))
  require("jdtls").start_or_attach(config)
end

return M
