#========================= env
set fish_greeting
set -x EDITOR helix

set -x MANAGER "less -R --use-color -Dd+r -Du+b"

# gpg ssh agent
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"

# proxy

set -x http_proxy "http://127.0.0.1:20171"
set -x https_proxy "http://127.0.0.1:20171"
set -x all_proxy "http://127.0.0.1:20171"

# set -a fish_user_paths ~/.local/bin

#========================= alias

alias cz chezmoi
alias lg lazygit

# set -a fish_user_paths ~/.local/bin

#========================= alias

#========================= custom plugin

if status --is-interactive
    alias cz chezmoi
    alias lg lazygit
    alias hx helix
    alias e $EDITOR
    zoxide init fish | source
    eval (zellij setup --generate-auto-start fish | string collect)
end
