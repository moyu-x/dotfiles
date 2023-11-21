### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions

autoload -Uz compinit; compinit

### End of Zinit's installer chunk
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# fzf config, must be after fast-syntax-highlighting, zsh-autusuggestions, compinit
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zinit light Aloxaf/fzf-tab
zinit load ellie/atuin


# jenv config
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# common config
export PATH="/usr/local/sbin:$HOME/.local/bin:$HOME/go/bin:$PATH"
export EDITOR=lvim
export LANG=en_US.UTF-8

if [[ `uname` == "Darwin" ]]; then
    # Homebrew config
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
    export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
    # node config
    export LDFLAGS="-L/usr/local/opt/node@18/lib"
    export CPPFLAGS="-I/usr/local/opt/node@18/include"
fi

# starship config
eval "$(starship init zsh)"
# zinit light spaceship-prompt/spaceship-prompt
#zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
#zinit light sindresorhus/pure

# No bell: Shut up Zsh
unsetopt beep

# zsh history config
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# alias
alias zshconfig="lvim ~/.zshrc"
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias ls="lsd"
alias vim="nvim"
alias tid='tid() { ssh-keygen -R 10.0.$1 -y && ssh-copy-id root@10.0.$1 };tid'
alias th='th() { tssh root@10.0.$1 };th'
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
alias sourcezsh="source $HOME/.zshrc"
alias curl="curlie"
alias bbdown="BBdown --use-aria2c --aria2c-args=\"--max-download-limit=5M\""

# proxy config
useproxy () {
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  export all_proxy="socks5://127.0.0.1:7890"
  echo "Proxy on"
}

# where noproxy
noproxy () {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  echo "Proxy off"
}

