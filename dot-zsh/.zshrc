# NOTE command 指令无视shell中的同名函数，执行shell内建指令以及环境变量PATH中的命令
# test performance
declare -A MXARCHER
export MXARCHER[TEST]=0

if [[ ${MXARCHER[TEST]} == 1 ]];then
	zmodload zsh/zprof
	declare -g ZPLG_MOD_DEBUG=1
fi

(( ! $+commands[stow] )) && yay -S stow
(( ! $+commands[exa] )) && yay -S exa
(( ! $+commands[fd] )) && yay -S fd
(( ! $+commands[highlight] )) && yay -S highlight
(( ! $+commands[rg] )) && yay -S ripgrep
(( ! $+commands[bat] )) && yay -S bat
(( ! $+commands[trash] )) && yay -S trash-cli
(( ! $+commands[fzf] )) && yay -S fzf
(( ! $+commands[npm] )) && yay -S npm
(( ! $+commands[ccls] )) && yay -S ccls

# so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
# enable control-s and control-q
# see https://unix.stackexchange.com/questions/72086/ctrl-s-hangs-the-terminal-emulator
stty -ixon

# 
# exports
#


export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH" # 添加可执行文件的路径
fpath+=~/.config/zsh/completions # 自定义自动补全文件的路径


export KEYTIMEOUT=1

# flutter mirror
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"

# rust mirror
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup




# true color
if [[ $TMUX != "" ]] then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi

# npm 
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
[[ ! -d "$HOME/.npm-global" ]] && mkdir -p $HOME/.npm-global

# zinit location
declare -A ZINIT # or declare -A ZINIT
export ZINIT[HOME_DIR]="$HOME/.cache/zsh/zinit"
export ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
[[ ! -f "${ZINIT[BIN_DIR]}/zinit.zsh" ]] && \
	mkdir -p ${ZINIT[BIN_DIR]} && \
	git clone --depth=1 https://github.com/zdharma/zinit ${ZINIT[BIN_DIR]}

[[ ! -d "$HOME/.config/tmux/plugins/tpm" ]] && \
	git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm


# for fzf
export FZF_DEFAULT_COMMAND="fd --hidden --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -200'"

# z.lua
export _ZL_DATA="$HOME/.local/share/zsh/zlua"
export _ZL_MATCH_MODE=1

# typewritten
#export TYPEWRITTEN_PROMPT_LAYOUT="pure"
#export TYPEWRITTEN_RELATIVE_PATH="adaptive"
export TYPEWRITTEN_CURSOR="beam"

# zsh
declare -g HISTSIZE=10000 SAVEHIST=10000 HISTFILE=$HOME/.local/share/zsh/history
[[ ! -d "$HOME/.local/share/zsh" ]] && \
	command mkdir -p $HOME/.local/share/zsh && \
	command touch $HOME/.local/share/zsh/history

declare -F4 SECONDS=0

# proxychains
export PROXYCHAINS_CONF_FILE="$HOME/.config/proxychains/proxychains.conf"

#
# setopts
#


setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt LONG_LIST_JOBS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_NO_STORE
setopt INTERACTIVECOMMENTS



#
#autoloads
#

#避免绑定报错
autoload autosuggest-accept;zle -N autosuggest-accept 
autoload zle-keymap-select; zle -N zle-keymap-select


#
#keybinds
#


bindkey "^ " autosuggest-accept



#
# alias
#


# neovim

alias cvim="command nvim --cmd 'let g:vim_startup=1'"

alias ls="exa -bh --color=auto " # use exa to replace traditional ls
#alias ls="ls --color=auto"
alias l="ls" l.="ls -d .*" la="ls -a" ll="ls -al"  #ll="ls -lbt created"
alias df="df -h" du="du -h" cp="cp -v" mv="mv -v" plast="last -20"
alias reload="exec zsh -l -i" grep="command grep -i --color=auto" # not match binary files
alias pxy="export all_proxy='socks5://127.0.0.1:1089'"

ulimit -c unlimited


#
#zinit
#

source ${ZINIT[BIN_DIR]}/zinit.zsh

zinit wait lucid wait="1" for \
	hlissner/zsh-autopair \
	skywind3000/z.lua


zinit wait lucid for \
	atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
	zdharma/fast-syntax-highlighting \
	atload"!_zsh_autosuggest_start" \
	zsh-users/zsh-autosuggestions \
	blockf \
	zsh-users/zsh-completions

#zinit snippet OMZ::lib/history.zsh
#zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
#zinit snippet OMZ::plugins/extract/extract.plugin.zsh

zinit light reobin/typewritten

#
# functions
#

#
# zsytles
#

zstyle ':completion:*' rehash true

#
# others
#
#

# vi-mode
set -o vi
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# [ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
