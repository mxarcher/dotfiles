local function load_options()
	local global_local = {
		startofline	=	false;
		termguicolors	=	false;
		mouse		=	"nv";
		errorbells	=	true;
		visualbell	=	true;
		hidden		=	true;
		fileformats	=	"unix,mac,dos";
		magic		=	true;
		virtualedit	=	"block";
		encoding	=	"utf-8";
		clipboard	=	"unnamedplus";
		backup		=	false;
		writebackup	=	false;
		swapfile	=	false;
		history		=	2000;
		smarttab	=	true;
		shiftround	=	true;
		timeout		=	true;
		ttimeout	=	true;
		timeoutlen	=	500;
		ttimeoutlen 	=	10;
		updatetime	=	100;
		redrawtime	=	1500;
		ignorecase	=	true;
		smartcase	=	true;
		infercase	=	true;
		incsearch	=	true;
		showmode	=	false;
		ruler		=	false;
		winwidth	=	30;
		winminwidth	=	10;
		helpheight	=	12;
		cmdheight	=	2;
		cmdwinheight	=	5;
		laststatus	=	2;
		splitbelow	=	true;
		splitright	=	true;
		number		=	true;
	}
	for name,value in pairs(global_local) do
		vim.o[name]=value
	end
end
load_options()
