" *****************************************
"
"      _/\/\____/\/\_/\/\__________________
"     _/\/\____/\/\________/\/\/\__/\/\___ 
"    _/\/\____/\/\_/\/\___/\/\/\/\/\/\/\_  
"   ___/\/\/\/\___/\/\___/\/\__/\__/\/\_   
"  _____/\/\_____/\/\/\_/\/\______/\/\_    
" ____________________________________     

" LAST UPDATE: 2018-09-06
"
" Dein configure
"
" *****************************************

let s:plugin_dir = expand('~/.vim/bundle/')
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir
if &runtimepath !~# '/repos/dein.vim'
	if !isdirectory(s:dein_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	let g:rc_dir    = expand('')
	let s:toml      = g:rc_dir . '~/.vim/rc/plugin.toml'
	let s:lazy_toml = g:rc_dir . '~/.vim/rc/plugin_lazy.toml'

	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif


if has('vim_starting') && dein#check_install()
	call dein#install()
endif

filetype plugin indent on
set t_Co=256
set background=dark
colorscheme hybrid_material
syntax on

