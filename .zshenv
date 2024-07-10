export HOMEBREW_NO_AUTO_UPDATE=1

# ZDOTDIR 告訴zsh在指定的目錄中尋找並讀取設定檔，使其在當前的shell session和之後的session都可以存取.zshrc。
export ZDOTDIR=~/.config/zsh

# 環境變數HISTFILE，用於指定 Zsh（Z Shell）的歷史記錄文件的路徑和名稱。
export HISTFILE="/Users/dah/.config/zsh/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# 使新的命令記錄附加到現有的歷史記錄中，而不是覆蓋之前的記錄。
setopt appendhistory

# 使新的命令即時添加到歷史記錄中，而無需等到 Shell 會話結束。
setopt INC_APPEND_HISTORY

# 使得所有打開的 Zsh 會話之間共享歷史記錄
setopt SHARE_HISTORY

# 系統先在 /opt/bin 目錄中搜尋可執行檔，然後才在原來的 PATH 路徑中搜尋
export PATH="/opt/bin:$PATH"

# 教學：https://linux.vbird.org/linux_basic/centos7/0340bashshell-scripts.php#script_why
# 將~/bin路徑加入變數PATH，使得腳本可以再任意路徑下執行。若不加上，則只能在絕對路徑下執行。
# 用法：sh demo.sh 或 bash demo.sh 
export PATH="~/bin:$PATH"



# .zshrc, etc. are located here
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
    export ZDOTDIR=~/.config/zsh
fi


# 已經使用：touch ~/.hushlogin，使得Last Login的提示不再出現。


# 不知道以下命令的功能，或許可以刪除？
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
# l

# export LDFLAGS="-L/opt/homebrew/opt/SDL2/lib"
# export CFLAGS="-I/opt/homebrew/opt/SDL2/include"

# export LDFLAGS="-L/opt/homebrew/lib"
# export CFLAGS="-I/opt/homebrew/include/SDL2"
