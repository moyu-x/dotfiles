# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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
zinit ice depth=1
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \

### End of Zinit's installer chunk

### this begin custom config
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

autoload -Uz compinit; compinit
zinit light romkatv/powerlevel10k
zinit load Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh

[[ ! -f ~/.fzf.zsh ]] || source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(zoxide init zsh)"

# keymap
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias ls="exa"
alias vim="nvim"
alias tid='tid() { ssh-copy-id root@10.0.$1 };tid'
alias th='th() { ssh root@10.0.$1 };th'
alias find="fd"
alias grep="rg"
alias ll="ls -l"
alias du="dust"
alias df="duf"
alias tree="broot"
alias ack="ag"
alias cd="z"
alias curl="curlie"
alias gobl="GOOS=linux  GOARCH=amd64  go build"

# go alias
alias gor="go run"

# local sofware bin
export PATH="$PATH:$HOME/.local/bin"

# emacs config
export PATH="$PATH:$HOME/.emacs.d/bin"

# yarn config
export PATH="$PATH:$HOME/.yarn/bin"

# rust config
export PATH="$PATH:$HOME/.cargo/bin"

# go config
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# golangx proxy
export GOPROXY=https://proxy.golang.com.cn,direct

# homebrew mirror config
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"

# close homebrew autoupdate
export HOMEBREW_NO_AUTO_UPDATE=1

source $HOME/.config/broot/launcher/bash/br

rsmvn() {
	mvn package -DskipTests -U
	rsync -azvhP target/$1.jar root@10.0.$2:/opt/nta-light/$1/$1.jar
	ssh root@10.0.$2 "ambot-service restart $1"
}
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
