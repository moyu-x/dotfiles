# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

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
  fast-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
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
alias zshconfig="lvim ~/.zshrc"
alias ohmyzsh="lvim ~/.oh-my-zsh"

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
alias python="/usr/bin/python3"

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

# mac special config
if [[ `uname` == "Darwin" ]]; then
    # Homebrew config
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
fi

# jenv config
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# common config
export PATH="/usr/local/sbin:$HOME/.local/bin:$PATH"
export EDITOR=lvim
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# other config
eval "$(atuin init zsh)"
#eval "$(starship init zsh)"
fpath+=("$(brew --prefix)/share/zsh/site-functions")
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_rainbow.omp.json)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# g shell setup
if [ -f "${HOME}/.g/env" ]; then
    . "${HOME}/.g/env"
fi
unalias g
export PATH="$HOME/go/bin:$PATH"
