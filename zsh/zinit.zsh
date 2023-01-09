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

# Homebrew config
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"

# common config
export PATH="/usr/local/sbin:$PATH"

# oh-my-posh
if [[ `uname` == "Darwin" ]]; then
    eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_rainbow.omp.json)"
else
    eval "$(oh-my-posh init zsh --config $HOME/.powerlevel10k_rainbow.omp.json)"
fi

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# alias
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias ls="exa"
alias vim="nvim"
alias tid='tid() { ssh-copy-id root@10.0.$1 };tid'
alias th='th() { ssh root@10.0.$1 };th'
alias rsync="rsync -azvhP"
alias find="fd"
alias grep="rg"
alias ll="ls -l"
alias du="dust"
alias df="duf"
alias tree="broot"
alias ack="ag"
alias curl="curlie"
alias gobl="GOOS=linux  GOARCH=amd64  go build"

