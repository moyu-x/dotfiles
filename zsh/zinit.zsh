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

# common config
export PATH="/usr/local/sbin:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# starship config
eval "$(starship init zsh)"
# zinit light spaceship-prompt/spaceship-prompt
#zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
#zinit light sindresorhus/pure

# No bell: Shut up Zsh
unsetopt beep

# alias
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias ls="lsd"
alias vim="nvim"
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
alias mvnd11cp="mvnd clean package -DskipTests=true -Dmaven.compiler.release=11"
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
alias gf=gf

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# mise config
eval "$(mise activate zsh)"
