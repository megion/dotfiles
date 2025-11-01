return {
  {
    "junegunn/fzf.vim",
    -- optional for icon support
    build = ":call fzf#install()", -- Optional, if you want fzf#install() to run
    dependencies = { "junegunn/fzf" },
    config = function()
      -- Your fzf.vim specific configurations go here
      -- For example:
      -- vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
      -- vim.g.fzf_buffers_jump = 1
      -- Add any other fzf.vim options or mappings you need
    end,
    opts = {},
  },
}
