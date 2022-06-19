if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/go/bin $PATH
set -x GOPROXY https://proxy.golang.com.cn,direct

alias ls exa
alias vim nvim

starship init fish | source
