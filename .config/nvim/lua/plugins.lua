return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    -- use 'rust-lang/rust.vim'        -- 支援 Rust 語言的語法高亮
    use 'luochen1990/rainbow'	       -- 將括號以不同的顏色標記
    -- use 'neovimhaskell/haskell-vim' -- 支援 Haskell 語言的語法高亮
    use 'tpope/vim-surround'	       -- 利用快捷鍵來快速更改“ ”或' '。 e.g. cs"'
    use 'tpope/vim-commentary'         -- press gcc to comment
    -- use 'tpope/vim-dispatch'
    -- use 'tpope/vim-fugitive'
    -- use 'tpope/vim-abolish'
    -- use 'Shirk/vim-gas'             -- syntax highlighting for asm
    use 'junegunn/fzf'    	       	   -- 使nvim用fzf。依賴：brew install fzf
    use 'junegunn/fzf.vim'	           -- 將 junegunn/fzf 命令行工具的功能整合到 Vim 中。 依賴：fzf、ripgrep
    use 'nvim-lua/plenary.nvim'        -- 註1
    -- use 'gfanto/fzf-lsp.nvim'
    use 'BurntSushi/ripgrep'	       -- 搜尋資料夾的工具 --(OK
    use 'nvim-pack/nvim-spectre'       -- 簡化並增強搜索和替換的功能。安裝依賴：gnu-sed
    -- use 'DingDean/wgsl.vim'         -- WGSL syntax highlight for vim
    use 'neovim/nvim-lspconfig'	       -- 幫助設定和使用LSP
    use { 'ray-x/lsp_signature.nvim', commit = "1d96fac72eb6d74abd5b4d7883a01f58aeb4f87e" } -- 提示功能，更有效地閱讀和使用程式碼。
    use 'hrsh7th/cmp-nvim-lsp'         -- 註2
    use 'hrsh7th/cmp-buffer'           -- 註3
    use 'hrsh7th/cmp-path'             -- 註4
    use 'hrsh7th/cmp-cmdline' 	       -- 註5
    use 'hrsh7th/nvim-cmp'   	       -- 註6(OK
    use 'hrsh7th/vim-vsnip'            -- 更輕鬆地在編輯程式碼時插入預定義的程式碼片段(OK
    use 'SirVer/ultisnips'             -- 能夠在編輯程式碼時輕鬆地插入預定義的程式碼片段(OK
    use 'quangnguyen30192/cmp-nvim-ultisnips'   -- 允許在編輯程式碼時，根據 UltiSnips 的程式碼片段來進行自動完成功能。
    use 'zefei/vim-colortuner' 
	use { 'nvim-treesitter/nvim-treesitter', tag = 'v0.8.1' } 
    use 'sbdchd/neoformat'
	-- 在編輯器中顯示文件和目錄的圖標。它的主要目的是為 Neovim 的文件瀏覽器或其他插件添加顏色編碼的文件和目錄圖標
    use 'nvim-tree/nvim-web-devicons'       
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'windwp/nvim-autopairs'
    use 'preservim/vimux'
    use 'easymotion/vim-easymotion'


    use 'simrat39/symbols-outline.nvim' -- has installed, but doesn't work.
    -- use 'RRethy/vim-illuminate'	    -- automatically highlighting other uses of the word under the cursor. 和nvim-treesitter有bug
    use 'tommcdo/vim-lion'		        -- 用來對齊運算子 shortcuts on repo 
    use 'sindrets/diffview.nvim'        -- ?????
    use 'honza/vim-snippets'  	  	    -- 提供if-else的程式碼片段

	use { "ibhagwan/fzf-lua",
	  -- optional for icon support
	  requires = { "nvim-tree/nvim-web-devicons" }
	}

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	}
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
	use { "nvim-neotest/nvim-nio" }
	use 'mfussenegger/nvim-dap'
	use 'mfussenegger/nvim-dap-python'
	use 'mortepau/codicons.nvim'
end)







-- 註1
-- plenary.nvim解釋：
-- 幫助nvim插件開發者更輕鬆地創建功能強大的插件。該函式庫目標提供一個基礎框架，使插件開發變得更加容易，同時避免重複造輪子。

-- 註2
-- hrsh7th/cmp 插件的一個擴充，旨在提供 Language Server Protocol（LSP）的自動完成功能，以及與其他自動完成插件 hrsh7th/nvim-cmp 的整合。

-- 註3 
-- hrsh7th/cmp 插件的一個擴充，旨在提供緩衝區（Buffer）相關的自動完成功能，以及與其他自動完成插件 hrsh7th/nvim-cmp 的整合。

-- 註4
-- 是 hrsh7th/cmp 插件的擴充，旨在提供路徑（Path）相關的自動完成功能，以及與其他自動完成插件 hrsh7th/nvim-cmp 的整合。

-- 註5
-- hrsh7th/cmp 插件的一個擴充，旨在提供命令行（Cmdline）相關的自動完成功能

-- 註6
-- 提供強大的、可自定義的自動完成框架，使您能夠更輕鬆地在編輯程式碼時進行自動完成操作。
-- 這個插件與多個源（source）插件整合，可以提供各種類型的自動完成建議，包括關鍵字、緩衝區內容、文件路徑、LSP（Language Server Protocol）等。

-- Packer Commands
-- :PackerSync
-- 確保插件保持最新狀態，以及在添加、刪除或更改插件配置時更新插件列表
-- 只要有更改過Plugins.lua就要Sync，確保插件列表與Plugins.lua中的設定是一致的

-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
-- :PackerCompile

-- Remove any disabled or unused plugins
-- :PackerClean

-- Clean, then install missing plugins
-- :PackerInstall

-- Clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
-- :PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- supports the `--preview` flag as an optional first argument to preview updates
-- :PackerSync

-- Show list of installed plugins
-- :PackerStatus

-- Loads opt plugin immediately
-- :PackerLoad completion-nvim ale
