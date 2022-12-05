if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $PATH
set -x HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
set -x HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
set -x HOMEBREW_BOTTLE_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles"
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x LC_ALL en_US.UTF-8
set -x LANG zh_CN.UTF-8 

alias ls exa
alias vim nvim

function tid
    ssh-copy-id root@10.0.$argv
end

function th
    ssh root@10.0.$argv
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
oh-my-posh init fish --config ~/.config/fish/omp.json | source

