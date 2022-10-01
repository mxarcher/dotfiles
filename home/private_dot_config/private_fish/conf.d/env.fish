set -a fish_user_paths ~/.local/bin

set -x EDITOR nvim
set -x MANAGER "less -R --use-color -Dd+r -Du+b"

# python virtualenvwrapper
#set -x WORKON_HOME ~/.pyvenvs
# yarn
#set -ax fish_user_paths (yarn global bin)

# rust 
set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -x RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -ax fish_user_paths ~/.cargo/bin
# go
set -x GO111MODULE on
set -x GOPROXY https://goproxy.cn
set -x GOPATH $HOME/.golang
set -ax fish_user_paths $HOME/.golang/bin

# gpg-agent
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
# gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
