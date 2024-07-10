export PYDEVD_DISABLE_FILE_VALIDATION=1

export OPENAI_API_KEY='sk-proj-lOIFkkCvWtSmi4CtwSUFT3BlbkFJrrKzjKNZX2rS2OlKGeou'
# 不會在brew install <package> 時自動更新所有套件
export HOMEBREW_NO_AUTO_UPDATE=1

export BAT_CONFIG_PATH="/Users/dah/.config/bat/config"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# LD_LIBRARY_PATH: 
# 一個環境變量，用於指定運行時動態鏈接器在哪些目錄中搜索共享庫。
# 共享庫是一種可執行代碼的形式，它可以被多個程序共享，
# 以減少內存佔用和提高代碼重用性。
# 將llvm函式庫的路徑加到LD_LIBRARY_PATH，以便程式運行期間能加載
# 和使用llvm相關的函式庫，這動作叫做“動態連結”
# export LD_LIBRARY_PATH="/opt/homebrew/opt/llvm/lib:$LD_LIBRARY_PATH"

# export LDFLAGS="-L/opt/homebrew/opt/SDL2/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/SDL2/include"

# 參考資料：https://ixyzero.com/blog/archives/2840.html
# 解決clangd #include <SDL.h> 'SDL.h' file not found
# 且使得編譯命令不需加上-I/opt/homebrew/include/SDL2
export CPLUS_INCLUDE_PATH=/opt/homebrew/include/SDL2:$CPLUS_INCLUDE_PATH     
export C_INCLUDE_PATH=/opt/homebrew/include/SDL2:$C_INCLUDE_PATH             

# 若改成 = .../incldue 去掉SDL2呢？  
# export C_INCLUDE_PATH=/opt/homebrew/include/:$C_INCLUDE_PATH             

# 使得編譯命令不需加上 -L/opt/homebrew/lib
# 將該路徑設定至環境變數，使得作業系統會先去指定路徑底下找，
# 找不到就去系統路徑
export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH

# 效果: 可在命令行中直接運行llvm相關的工具，如clang、clang++ 等，而不必輸入完整的路徑(預設是/usr/bin/clang會先被使用)
# Jdh是只在.zshenv中設定，但我必須要在.zshrc才行
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# 避免tldr自動更新。
export TLDR_AUTO_UPDATE_DISABLED

alias nvim=~/Downloads/nvim0.9.5/bin/nvim
# alias nvim=~/Downloads/nvim0.10.0/nvim-macos-arm64/bin/nvim

# homebrew in path
eval $(/opt/homebrew/bin/brew shellenv)

# # 每次打開終端機時，立刻進入tmux
if [ -z "$TMUX" ]; then # -z 意思為zero length。-z "$TMUX" 檢查 $TMUX 是否為空字串。
  # exec arch -arm64 tmux
  tmux
fi

# match terminal
export BAT_THEME=gruvbox-dark

# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# zsh-autosuggest config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="geoffgarside" # set by `omz`

# if type rg &> /dev/null; then
#   export FZF_DEFAULT_COMMAND='rg --files'
#   export FZF_DEFAULT_OPTS='-m --height 50% --border'
# fi


# ~/.fzf.zsh: 这一行检查是否存在文件 ~/.fzf.zsh，如果存在则执行 source 命令，即加载 ~/.fzf.zsh 文件。这可以用来进一步配置或扩展 fzf 的功能。
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

