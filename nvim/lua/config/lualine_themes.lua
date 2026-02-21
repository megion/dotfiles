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

-- Make the function globally accessible
_G.MyEslint = MyEslint
