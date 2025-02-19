vim.g.mapleader = ","

vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])

require('plugins')
require('mylsp')
require('nvimcmp')

require('lualine').setup{
  sections = {
    lualine_c = {
      'filename',
      function()
        return vim.fn['nvim_treesitter#statusline'](180)
      end},
  },
}

require('nvim-treesitter.configs').setup {
	highlight = {
	  enable = true, 
	  additional_vim_regex_highlighting = false,
	},
}

require("gruvbox").setup({
	invert_selection = true,
	contrast = "", -- soft/hard/""
	-- transparent_mode = true, -- true: 對比強制為hard，且FzfLua時背景會變清楚
    inverse = false, -- invert background for search, diffs, statuslines and errors

    overrides = {
		-- 嘗試
        ["@module.python"] = { fg = "#458588" }, 
		-- ["@property.c"] = { fg = "#458588" }, -- struct members (suite for BIG project)
        -- ["@variable.c"] = { fg = "#458588" },
        -- ["@variable.cpp"] = { fg = "#458588" },

		-- C/C++ old colors
	    ["@variable.c"] = { fg = "#83a598" },
	    ["@keyword.modifier.c"] = { fg = "#fe8019" }, -- GruvboxOrange
        ["@operator.c"] = { fg = "#ebdbb2" },         -- GruvboxFg
        ["@constant.macro.c"] = { fg = "#d3869b" },   -- GruvboxPurple

        ["@module.cpp"] = { fg = "#83a598" },
        ["@constant.macro.cpp"] = { fg = "#d3869b" },   -- GruvboxPurple
        ["@variable.cpp"] = { fg = "#83a598" },
        ["@operator.cpp"] = { fg = "#ebdbb2" },         -- GruvboxFg
        ["@keyword.modifier.cpp"] = { fg = "#fe8019" }, -- Orange(#fe8019) or Yellow(#fabd2f)
        ["@namespace.cpp"] = { link = "GruvboxAqua" },  -- GruvboxFg
		
    }
})
-- 使用 Treesitter 高亮規則
-- vim.cmd [[highlight link DiagnosticUnnecessary GruvboxFg1]]
vim.cmd("colorscheme gruvbox") -- Gruvbox hard -> Brightness = -1, Contrast = +2

-- vim.api.nvim_set_hl(0, '@lsp.type.namespace.cpp', { link = 'GruvboxAqua' })
-- vim.api.nvim_set_hl(0, '@lsp.type.macro.cpp', { link = 'GruvboxPurple' })
-- vim.api.nvim_set_hl(0, '@lsp.type.variable.cpp', { link = 'GruvboxAqua' })

-- vim.api.nvim_set_hl(0, 'cError', { link = 'GruvboxAqua' })
-- vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = 'GruvboxAqua' })



-- New colors 
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#fabd2f" }) -- GruvboxYellow
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#665c54" }) --  設定補全背景
-- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#fabd2f", bg = "#665c54" }) -- 設定 Snippet 的顏色
-- vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#ebdbb2" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#665c54" }) -- shift + K 後的背景
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#fabd2f" }) -- 設定 Function 顏色
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#b8bb26" }) -- 設定 Function 顏色
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#fabd2f" }) 
-- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#fabd2f" }) 

-- Old colors LGTM :)
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#fabd2f" }) -- GruvboxYellow
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#665c54" }) --  設定補全背景
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#fabd2f", bg = "#665c54" }) -- 設定 Snippet 的顏色
vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#ebdbb2" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#665c54" }) -- shift + K 後的背景
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#fabd2f" }) -- 設定 Function 顏色
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#fabd2f" }) -- 設定 Function 顏色
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#fabd2f" }) 
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#fabd2f" }) 
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#fabd2f" }) 
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#fabd2f" }) 
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#fabd2f" }) 


vim.api.nvim_set_keymap('n', '<C-p>', ":FzfLua files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-g>', ":FzfLua grep<CR>", { noremap = true, silent = true })
local actions = require "fzf-lua.actions"
require("fzf-lua").setup{
  actions = {
	files = {
	  ["enter"]  = actions.file_edit_or_qf,
	  ["ctrl-x"] = actions.file_split,
	  ["ctrl-v"] = actions.file_vsplit,
	  ["ctrl-t"] = actions.file_tabedit,
	  ["alt-q"]  = actions.file_sel_to_qf,
	  ["alt-Q"]  = actions.file_sel_to_ll,
	},
  },

  fzf_opts = {
	["--ansi"]           = true,
	["--info"]           = "inline-right",
	["--height"]         = "100%",
	["--layout"]         = "default",
	["--border"]         = "none",
	["--highlight-line"] = true,
  },

  winopts = {
	  border = "thicc", -- preview border: accepts both `nvim_open_win`
	preview = {
	  border    = "thicc", -- preview border: accepts both `nvim_open_win`
	  vertical  = 'up:60%', -- 將 preview 顯示在上面
	  title_pos = "center", -- left|center|right, title alignment
	}
  },
}
-- require("mason").setup()

-- 初始化 mason-lspconfig，不指定任何特定的 LSP 伺服器
-- require("mason-lspconfig").setup {
-- 啟動時自動檢查和確保特定的 LSP 伺服器已經安裝。
--   ensure_installed = { "pyright" }, 
-- }

-- require("dap-python").setup("/Users/dah/.virtualenvs/debugpy/bin/python")
-- If using the above, then `/path/to/venv/bin/python -m debugpy --version`
-- must work in the shell

-- local dap = require('dap')

-- dap.adapters.debugpy = {
-- 	type = 'executable';
-- 	command = os.getenv('HOME') .. '/.virtualenvs/debugpy/bin/python3 -m debugpy';
-- 	args = { '-m', 'debugpy.adapter' };
-- }

-- dap.configurations.python = {
--   {
-- 	type = 'python';
-- 	request = 'launch';
-- 	name = "Launch file";
-- 	program = "${file}";
--     console = "integratedTerminal";
-- 	pythonPath = function()
-- 	  return '/usr/bin/python3'
-- 	end;
--   },
-- }

-- continue, step into, step over, step out, ?, restart, stop
-- ICON: https://stackoverflow.com/questions/715910/unicode-first-previous-next-and-last
-- local dapui = require('dapui')
-- dapui.setup(  {
--     controls = {
--       element = "repl",
--       enabled = true,
--       icons = {
--         disconnect = "Disconnect",
--         pause = "Pause",
--         play = "Play",
--         run_last = "RunLast", -- last
--         step_back = "StepBack",
--         step_into = "StepInto", -- continue
--         step_out = "StepOut",
--         step_over = "StepOver",
--         terminate = "Terminate",
--         terminate = "Terminate",
--       }
--     },
--     element_mappings = {},
--     expand_lines = true,
--     floating = {
--       border = "single",
--       mappings = {
--         close = { "q", "<Esc>" }
--       }
--     },
--     force_buffers = true,
--     icons = {
--       collapsed = "",
--       current_frame = "",
--       expanded = ""
--     },
--     layouts = { {
--         elements = { {
--             id = "scopes",
--             size = 0.25
--           }, {
--             id = "breakpoints",
--             size = 0.25
--           }, {
--             id = "stacks",
--             size = 0.25
--           }, {
--             id = "watches",
--             size = 0.25
--           } },
--         position = "left",
--         size = 40
--       }, {
--         elements = { {
--             id = "repl",
--             size = 0.5
--           }, {
--             id = "console",
--             size = 0.5
--           } },
--         position = "bottom",
--         size = 10
--       } },
--     mappings = {
--       edit = "e",
--       expand = { "<CR>", "<2-LeftMouse>" },
--       open = "o",
--       remove = "d",
--       repl = "r",
--       toggle = "t"
--     },
--     render = {
--       indent = 1,
--       max_value_lines = 100
--     }
--   })
-- dap.listeners.before.attach.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

-- spectre
require('spectre').setup({
  live_update = true,
  ['run_replace'] = {
    map = "<leader>l",
    cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
    desc = "replace all"
  },
  find_engine = {
    ['rg'] = {
      cmd = "rg",
      args = {
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--pcre2',
      } ,
      options = {
        ['ignore-case'] = {
          value= "--ignore-case",
          icon="[I]",
          desc="ignore case"
        },
        ['hidden'] = {
          value="--hidden",
          desc="hidden file",
          icon="[H]"
        },
        -- you can put any rg search option you want here it can toggle with
        -- show_option function
      }
    },
  }
})

require('symbols-outline').setup() 
vim.api.nvim_set_keymap('n', '<leader>s', ':SymbolsOutline<CR>', { noremap = true, silent = true })

-- lsp_signature.nvim
require "lsp_signature".setup({
  hint_prefix = "",
  floating_window = false,
  bind = true,
})

-- from :h lsp-semantic-highlight. Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

-- 設定 LSP 日誌層級，如果警告訊息不影響功能運行，你可以選擇降低 LSP 日誌層級，
vim.lsp.set_log_level('ERROR')
-- turn off lsp.log at ~/.local/state/nvim/lsp.log
vim.lsp.set_log_level("OFF")
