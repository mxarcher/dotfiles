fish_vi_key_bindings

set fish_greeting


alias cz "chezmoi"
alias cze "chezmoi edit"
alias czc "cd (chezmoi source-path)"
alias lg "lazygit"
alias ls "exa --git --time-style iso"
alias ll "ls -l "
alias la "ll -a"
alias lt "ll -s time"
alias l1 "ls -1"
alias tree "ls -T"
alias rg "rg --smart-case"
alias rg1="rg --maxdepth 1"
alias rg2="rg --maxdepth 2"
alias grep "rg"
alias df "df -TH"
alias ip "ip -color=auto"
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
if status --is-interactive 
   # type -q neofetch
   neofetch
   zoxide init fish | source
   rustup completions fish | source
   set_proxy
end


