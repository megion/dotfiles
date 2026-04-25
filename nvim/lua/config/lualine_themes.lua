function MyEslint()
  -- Setup lualine with the new theme
  -- require("lualine").setup({
  --   options = { theme = theme_name },
  -- })
  -- local job_output = vim.fn.systemlist("pnpm lint")
  -- -- job_output is a table of strings (lines)
  -- -- You may need to process the output into the correct format for setqflist()
  -- -- If the output already matches 'errorformat', you can pass it directly.
  -- vim.fn.setqflist({}, "r", { lines = job_output })
  -- vim.cmd("copen")

  -- vim.cmd("OverseerRun eslint-project")
  -- vim.cmd("OverseerOpen")
  local overseer = require("overseer")
  --
  -- overseer.run_task({ name = "eslint-project" }, function(task)
  --   if task then
  --     overseer.run_action(task, "open float")
  --   end
  -- end)

  local task = overseer.new_task({
    -- cmd = "pnpm lint",
    cmd = { "pnpm", "lint" },
    components = {
      -- Add on_complete_notify first with a customized 'statuses' parameter
      -- { "on_complete_notify", statuses = { "SUCCESS" } },
      { "open_output" },
      { "on_output_parse", problem_matcher = "$eslint-stylish" },
      { "on_result_diagnostics_quickfix", open = false },

      -- { "on_output_quickfix", open = true },
      -- { "on_result_diagnostics_trouble" },

      -- The default group also adds on_complete_notify,
      -- but since it appears second it will be ignored.
      "default",
    },
  })
  -- on_complete gets called with the same arguments as it does for components
  task:subscribe("on_complete", function(_task, status, result)
    if status == "SUCCESS" then
      -- print("Task", task.name, "finished with status", status)
      vim.cmd("pclose")
    end
    vim.cmd("OverseerToggle")
    vim.cmd("Trouble quickfix")
  end)

  task:start()
end

function MyBuild()
  -- vim.cmd("OverseerRun eslint-project")
  -- vim.cmd("OverseerOpen")
  local overseer = require("overseer")
  --
  -- overseer.run_task({ name = "eslint-project" }, function(task)
  --   if task then
  --     overseer.run_action(task, "open float")
  --   end
  -- end)

  local task = overseer.new_task({
    -- cmd = "pnpm lint",
    cmd = { "pnpm", "build" },
    components = {
      -- Add on_complete_notify first with a customized 'statuses' parameter
      -- { "on_complete_notify", statuses = { "SUCCESS" } },
      { "open_output" },
      { "on_output_parse", problem_matcher = "$tsc" },
      { "on_result_diagnostics_quickfix", open = false },

      -- { "on_output_quickfix", open = true },
      -- { "on_result_diagnostics_trouble" },

      -- The default group also adds on_complete_notify,
      -- but since it appears second it will be ignored.
      "default",
    },
  })
  -- on_complete gets called with the same arguments as it does for components
  task:subscribe("on_complete", function(_task, status, result)
    if status == "SUCCESS" then
      -- print("Task", task.name, "finished with status", status)
      vim.cmd("pclose")
    end
    vim.cmd("OverseerToggle")
    vim.cmd("Trouble quickfix")
  end)

  task:start()
end

-- Make the function globally accessible
_G.MyEslint = MyEslint

function MyGradle()
  local overseer = require("overseer")

  local java_pattern = {
    regexp = "^%s*(.*):(%d+):%s*(%a+):%s*(.*)$",
    file = 1,
    line = 2,
    severity = 3, -- Matches "error" or "warning"
    message = 4,
  }

  local task = overseer.new_task({
    -- cmd = "pnpm lint",
    cmd = {
      "./gradlew",
      ":service-impl:home-management-service:home-management-service-impl:compileJava",
    },
    components = {
      -- Add on_complete_notify first with a customized 'statuses' parameter
      -- { "on_complete_notify", statuses = { "SUCCESS" } },
      { "open_output" },
      {
        "on_output_parse",
        -- problem_matcher = {
        --   owner = "java",
        --   fileLocation = { "relative", "${workspaceFolder}" },
        --   pattern = java_pattern,
        -- },
        --owner": "java",
        -- "fileLocation": ["relative", "${workspaceFolder}"],
        -- "pattern": {
        --     "regexp": "^(.+\\.java):(\\d+):(?:\\s+(error)):(?:\\s+(.*))$",
        --     "file": 1,
        --     "line": 2,
        --     "severity": 3,
        --     "message": 4,
        --     "loop": true
        -- }
        -- problem_matcher = "$gcc",
        --
        -- try parser error like:
        --
        -- /home/ilya/workspaces/hcs/service-impl/home-management-service/home-management-service-impl/src/main/java/ru/lanit/hcs/homemanagement/impl/HouseServiceImpl.java:1139: error: cannot find symbol
        --                 egrpPremiseGuid, egrpRefs, skipSearchLivingCounts);
        --                 ^
        --   symbol:   variable egrpPremiseGuid
        --   location: class HouseServiceImpl
        problem_matcher = {
          -- owner = "gradle",
	  fileLocation = "absolute",
          pattern = {
            regexp = "^(.*?) =(\\d+):(\\d*):?\\s+(?:fatal\\s+)?(warning|error):\\s+(.*)$",
            -- vim_regexp = "\\v^(.{-}):(\\d+):(\\d*):?\\s+%(fatal\\s+)?(warning|error):\\s+(.*)$",
            file = 1,
            line = 2,
            column = 3,
            severity = 4,
            message = 5,
          },
          -- },
        },
      },
      { "on_result_diagnostics_quickfix", open = false },

      "default",
    },
  })
  -- on_complete gets called with the same arguments as it does for components
  task:subscribe("on_complete", function(_task, status, result)
    if status == "SUCCESS" then
      -- print("Task", task.name, "finished with status", status)
      vim.cmd("pclose")
    end
    vim.cmd("OverseerToggle")
    vim.cmd("Trouble quickfix")
  end)

  task:start()
end

-- Make the function globally accessible
_G.MyGradle = MyGradle
