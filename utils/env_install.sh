printf ":: Fonts Check\n\n"
if [[ $(fc-list | grep "icomoon" -c) -eq 0 ]];then
	yay -S ttf-icomoon-feather
fi
printf ":: Fonts Check Completed\n\n"

if [[ ! -d $HOME/.cache/zsh ]];then
	mkdir -p $HOME/.cache/zsh
	touch $HOME/.cache/zsh/history
	touch $HOME/.cache/zsh/zlua
fi

printf ":: Software Check\n\n"

# instructions
if [[ ! -x "$(command -v exa)" ]];then
	yay -S exa
fi
if [[ ! -x "$(command -v fd)" ]];then
	yay -S fd
fi
if [[ ! -x "$(command -v highlight)" ]];then
	yay -S highlight
fi
if [[ ! -x "$(command -v ag)" ]];then
	yay -S the_silver_searcher
fi
if [[ ! -x "$(command -v bat)" ]];then
	yay -S bat
fi
if [[ ! -x "$(command -v fzf)" ]];then
	yay -S fzf
fi
if [[ ! -x "$(command -v stow)" ]];then
	yay -S stow
fi


# applications
if [[ ! -x "$(command -v zathura)" ]];then
	yay -S zathura
fi
if [[ ! -x "$(command -v flameshot)" ]];then
	yay -S flameshot
fi
if [[ ! -x "$(command -v typora)" ]];then
	yay -S typora
fi
if [[ ! -x "$(command -v peek)" ]];then
	yay -S peek
fi
if [[ ! -x "$(command -v chromium)" ]];then
	yay -S chromium
fi
printf ":: Software Check Completed\n"
