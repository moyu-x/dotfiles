if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

# set -x HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
# cset -x HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
# set -x HOMEBREW_BOTTLE_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles"
set -x HOMEBREW_NO_AUTO_UPDATE 1

set -x PATH $HOME/.jenv/bin /usr/local/sbin $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $PATH
set -x LC_ALL en_US.UTF-8
set -x LANG zh_CN.UTF-8

# keymap
alias ls lsd
alias vim nvim
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias ls="lsd"
alias vim="nvim"
alias ssh="tssh"
alias rsync="rsync -azvhP"
alias find="fd"
alias grep="rg"
alias ll="ls -l"
alias du="dust"
alias df="duf"
alias tree="broot"
alias ack="ag"
alias gobl="GOOS=linux  GOARCH=amd64  go build"
alias mvncp="mvn clean package -DskipTests"
alias mvndcp="mvnd clean package -DskipTests=true"
alias mvnd8cp="mvnd clean package -DskipTests=true -Dmaven.compiler.release=8"
alias gcam="git commit -am"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gpl="git pull"
alias gph="git push"
alias gs="git status"
alias gd="git diff"
alias gst="git status"
alias gpo="git push --set-upstream origin"
alias curl="curlie"
alias bbdown="BBdown --use-aria2c --aria2c-args=\"--max-download-limit=5M\""

# jenv config
status --is-interactive; and jenv init - | source
