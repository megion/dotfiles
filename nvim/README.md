# My neovim configs

## Debug the `init.lua` configuration file

see: https://github.com/jbyuki/one-small-step-for-vimkind/blob/main/doc/osv.txt#L211

1. Launch the debuggee instance with:
>sh
    nvims --cmd "lua init_debug=true"

The instance should freeze immediately. This neovim instance will be as instance for debug.
For example open `cpwite` project.

2. Open another Neovim instance (with debug code `nvim`) as you normally would.
- set a breakpoint in `nvim/init.lua` (press `<Leader>b`) or another file for debug for example `nvim/lua/tools/cpp_extract.lua#821`
- connect to the debugged instance using the DAP client. Press `<F5>` or execute `lua require("dap").continue()`
See debug mappings `nvim/lua/plugins/dap.lua`:
  - `<F10>` step over
  - `<F11>` ster into
  - `<F12>` ster out

Execution should resume until it reaches the breakpoint, allowing you to
step through the `init.lua` code.
