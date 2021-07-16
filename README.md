# Dotfiles


<!--
[screenshot](https://github.com/mxarcher/example/raw/master/screenshots/arch.png)
-->
## Usage
```sh
yay -S stow
cd
git clone https://github.com/mxarcher/dotfiles.git .dotfiles
cd .dotfiles
```
use `stow --dotfiles -nSvt ~ $(fd "dot-.*" -d 1)` to make sure the results are right

then `stow --dotfiles -Svt ~ $(fd "dot-.*" -d 1)`
