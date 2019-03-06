" *****************************************
"
"      _/\/\____/\/\_/\/\__________________
"     _/\/\____/\/\________/\/\/\__/\/\___ 
"    _/\/\____/\/\_/\/\___/\/\/\/\/\/\/\_  
"   ___/\/\/\/\___/\/\___/\/\__/\__/\/\_   
"  _____/\/\_____/\/\/\_/\/\______/\/\_    
" ____________________________________     

" LAST UPDATE: 2019-03-06
"
" Plugin configure
" - plugin.toml
" - plugin_lazy.toml
"
" *****************************************
"

" NERDTree:{{{
" - https://github.com/scrooloose/nerdtree
" ******************************************************
map <C-a> :NERDTreeToggle<CR>

let g:NERDTreeShowBookmarks=1

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let NERDTreeShowHidden = 1
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('config' , 146 , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('conf'   , 146 , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('yml'    , 146 , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('json'   , 146 , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('toml'   , 146 , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('vim'    , 28  , 'none' , '#3366FF' , '#151515')
call NERDTreeHighlightFile('md'     , 189 , 'none' , '#3366FF' , '#151515')
call NERDTreeHighlightFile('txt'    , 189 , 'none' , '#3366FF' , '#151515')
call NERDTreeHighlightFile('html'   , 208 , 'none' , 'yellow'  , '#151515')
call NERDTreeHighlightFile('styl'   , 118 , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('css'    , 153 , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('scss'   , 213 , 'none' , 'cyan'    , '#151515')
call NERDTreeHighlightFile('js'     , 11  , 'none' , '#ffa500' , '#151515')
call NERDTreeHighlightFile('php'    , 141 , 'none' , '#ff00ff' , '#151515')
call NERDTreeHighlightFile('rb'     , 196 , 'none' , 'red'     , '#151515')
call NERDTreeHighlightFile('py'     , 77  , 'none' , 'yellow'  , '#151515')

" }}}


" NERDTreeGitPlugin:{{{
" - https://github.com/Xuyuanp/nerdtree-git-plugin
" ******************************************************
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "_",
    \ "Renamed"   : "@",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "-",
    \ "Dirty"     : ">",
    \ "Clean"     : "",
    \ 'Ignored'   : '!',
    \ "Unknown"   : "?"
    \ }
" }}}


" startify:{{{
" - https://github.com/Xuyuanp/nerdtree-git-plugin
" ******************************************************
let g:startify_bookmarks = [
    \ "~/.vim/vimrc",
    \ "~/.vim/rc/",
    \ ]

" ASCII ARTを真ん中寄せする
" :h startifyを参照
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
            \'',
            \'',
            \'     _____/\/\____/\/\_/\/\______________________',
            \'    _____/\/\____/\/\________/\/\/\__/\/\_______ ',
            \'   _____/\/\____/\/\_/\/\___/\/\/\/\/\/\/\_____  ',
            \'  _______/\/\/\/\___/\/\___/\/\__/\__/\/\_____   ',
            \' _________/\/\_____/\/\/\_/\/\______/\/\_____    ',
            \'____________________________________________     ',
            \'',
            \'     Think rich, look poor. - Andy Warhol',
            \''
    \ ])

            " \'',
            " \'',
            " \'                                            Y8b Y88888P ,e,             ',
            " \'                                             Y8b Y888P   "  888 888 8e  ',
            " \'                                              Y8b Y8P   888 888 888 88b ',
            " \'                                               Y8b Y    888 888 888 888 ',
            " \'                                                Y8P     888 888 888 888 ',

" }}}


" Lightline: {{{
" - https://github.com/itchyny/lightline.vim
" ******************************************************
let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\   'right': [ [ 'syntastic', 'lineinfo' ],
			\              [ 'percent' ],
			\              [ 'fileformat', 'fileencoding', 'filetype' ] ]
			\ },
			\ 'component_expand': {
			\   'syntastic': 'SyntasticStatuslineFlag',
			\ },
			\ 'component_type': {
			\   'syntastic': 'error',
			\ }
			\ }
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction
"}}}


" Parenmatch: {{{
" - https://github.com/itchyny/vim-parenmatch
" ******************************************************
let g:loaded_matchparen = 1
"}}}


" Matchtagalways: {{{
" - https://github.com/Valloric/MatchTagAlways
" ******************************************************
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
	\ 'php' : 1,
    \}
let g:mta_use_matchparen_group = 0
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
"}}}


" Emmet: {{{
" - https://github.com/mattn/emmet-vim
" ******************************************************
" let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_expandabbr_key = '<C-tab>'
let g:user_emmet_settings = {
\	'lang': 'ja',
\	'html': {
\		'indentation': ''
\	},
\	'css': {
\		'filters': 'fc'
\	},
\ }
" }}}


" operator-replace: {{{
" - https://github.com/kana/vim-operator-replace/blob/master/doc/operator-replace.txt
" ******************************************************
map r  <Plug>(operator-replace)
"}}}


" operator-surround: {{{
" ******************************************************
" operator mappings
map <silent>ra <Plug>(operator-surround-append)
map <silent>rd <Plug>(operator-surround-delete)
map <silent>rr <Plug>(operator-surround-replace)


" delete or replace most inner surround

" if you use vim-textobj-multiblock
nmap <silent>rdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
nmap <silent>rrr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

" if you use vim-textobj-anyblock
nmap <silent>rdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
nmap <silent>rrr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

" if you use vim-textobj-between
nmap <silent>rdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
"}}}


" yankround: {{{
" ******************************************************
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-[> <Plug>(yankround-prev)
nmap <C-]> <Plug>(yankround-next)
nnoremap <silent>gp :<C-u>Unite<Space>yankround<CR>

let g:yankround_dir = '$HOME/.vim/tmp/YNK/yankround'
"}}}


" easymotion: {{{
" ******************************************************
let g:EasyMotion_do_mapping = 0
nmap <C-G> <Plug>(easymotion-overwin-f2)
"}}}


" Vim-php-cs-fixer: {{{
" ******************************************************
" If php-cs-fixer is in $PATH, you don't need to define line below
let g:php_cs_fixer_path = "/Users/takei_kenji/.composer/vendor/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar

" If you use php-cs-fixer version 1.x
"let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
"let g:php_cs_fixer_config = "default"                  " options: --config
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
"let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
" End of php-cs-fixer version 1 config params

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@Symfony"          " options: --rules (default:@PSR2)
" let g:php_cs_fixer_cache = "~/.cache/php_cs/.cache" " options: --cache-file
" let g:php_cs_fixer_config_file = '~/.config/php_cs/.config' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "/usr/local/bin/php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.

" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
" }}}


" fzf.vim: {{{
" ******************************************************
set rtp+=/usr/local/opt/fzf
" Customize fzf colors to match your color scheme

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split' }

" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)


" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Baffers
  \ call fzf#vim#baffers(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>G :GFiles?<CR>

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>/ :Ag<CR>

" nnoremap <silent> <C-]> :call fzf#vim#tags(expand('<cword>'))<CR>
let g:fzf_tags_command = 'ctags -R -f .tags'
let g:fzf_buffers_jump = 1

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-s': 'split' }

"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | call fzf#vim#history() | endif
" }}}


" vim-gitgutter: {{{
set signcolumn=yes
let g:gitgutter_sign_added              = '|'
let g:gitgutter_sign_modified           = '|'
let g:gitgutter_sign_removed            = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed   = '|'
"}}}


" tagbar: {{{
nmap <C-k> :TagbarToggle<CR>
"}}}

