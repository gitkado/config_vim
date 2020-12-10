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
" defx :{{{
" - https://github.com/Shougo/defx.nvim
" ******************************************************

let g:rooter_manual_only = 1

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

nnoremap <silent><Leader><space> :Defx -split=floating -columns=icon:filename -toggle<CR>

autocmd FileType defx call s:defx_my_settings()


    call defx#custom#column('git', 'indicators', {
            \ 'Modified'  : '+',
            \ 'Staged'    : '-',
            \ 'Untracked' : '*',
            \ 'Renamed'   : '>',
            \ 'Unmerged'  : '=',
            \ 'Ignored'   : '.',
            \ 'Deleted'   : '!',
            \ 'Unknown'   : '?'
            \ })

    call defx#custom#column('icon', {
            \ 'directory_icon': '▸',
            \ 'opened_icon': '▾',
            \ 'root_icon': ' ',
            \ })
        function! s:defx_my_settings() abort

      nnoremap <silent><buffer><expr> <tab>
     \ defx#do_action('toggle_columns', ['git:mark:time:filename'])

      nnoremap <silent><buffer><expr> <Leader><Space>
     \ defx#do_action('quit')

      nnoremap <silent><buffer><expr> <ESC>
     \ defx#do_action('quit')

      nnoremap <silent><buffer><expr> q
     \ defx#do_action('quit')

     " Define mappings
      nnoremap <silent><buffer><expr> <CR>
     \ defx#is_directory() ?
     \ defx#do_action('open_or_close_tree') :
     \ defx#do_action('multi', ['drop', 'quit'])
      nnoremap <silent><buffer><expr> o
     \ defx#is_directory() ?
     \ defx#do_action('open_or_close_tree') :
     \ defx#do_action('multi', ['drop', 'quit'])
      nnoremap <silent><buffer><expr> c
     \ defx#do_action('copy')
      nnoremap <silent><buffer><expr> m
     \ defx#do_action('move')
      nnoremap <silent><buffer><expr> p
     \ defx#do_action('paste')
      nnoremap <silent><buffer><expr> l
     \ defx#is_directory() ?
     \ defx#do_action('open') :
     \ defx#do_action('open', 'vsplit')
      nnoremap <silent><buffer><expr> K
     \ defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> N
     \ defx#do_action('new_file')
      nnoremap <silent><buffer><expr> d
     \ defx#do_action('remove')
      nnoremap <silent><buffer><expr> r
     \ defx#do_action('rename')
      nnoremap <silent><buffer><expr> x
     \ defx#do_action('execute_system')
      nnoremap <silent><buffer><expr> yy
     \ defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> .
     \ defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> h
     \ defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> ~
     \ defx#do_action('cd')
      nnoremap <silent><buffer><expr> <Space>
     \ defx#do_action('toggle_select') . 'j'
      nnoremap <silent><buffer><expr> *
     \ defx#do_action('toggle_select_all')
      nnoremap <silent><buffer><expr> j
     \ line('.') == line('$') ? 'gg' : 'j'
      nnoremap <silent><buffer><expr> k
     \ line('.') == 1 ? 'G' : 'k'
      nnoremap <silent><buffer><expr> cd
     \ defx#do_action('change_vim_cwd')
    endfunction
" }}}


" startify:{{{
" - https://github.com/Xuyuanp/nerdtree-git-plugin
" ******************************************************
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
            \'     _____/\/\____/\/\_/\/\______________________',
            \'    _____/\/\____/\/\________/\/\/\__/\/\_______ ',
            \'   _____/\/\____/\/\_/\/\___/\/\/\/\/\/\/\_____  ',
            \'  _______/\/\/\/\___/\/\___/\/\__/\__/\/\_____   ',
            \' _________/\/\_____/\/\/\_/\/\______/\/\_____    ',
            \'____________________________________________     ',
            \'',
            \' 零式 特殊操作型 漆黒画面用 戦闘文字編集機 [改]',
            \''
    \ ])



let g:startify_custom_footer = s:filter_header([
            \'Think rich, look poor. - Andy Warhol       ',
            \'',
            \''
    \ ])

let g:startify_bookmarks = [
    \ "~/.vim/vimrc",
    \ "~/.vim/rc/",
    \ ]

let g:startify_session_before_save = [
    \ 'echo "Cleaning up before saving.."',
    \ 'silent! Defx'
    \ ]
let g:startify_lists = [
    \ { 'header': ['   MRU'],            'type': 'files' },
    \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
    \ { 'header': ['   Bookmarks'],      'type': 'bookmarks' },
    \ ]
" }}}


" Lightline: {{{
" - https://github.com/itchyny/lightline.vim
" ******************************************************
let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\   'right': [ ['lineinfo' ],
			\              [ 'percent' ],
			\              [ 'fileformat', 'fileencoding', 'filetype' ] ]
			\ },
			\ 'component_type': {
			\   'syntastic': 'error',
			\ }
			\ }
"}}}


" Parenmatch: {{{
" - https://github.com/itchyny/vim-parenmatch
" ******************************************************
"let g:loaded_matchparen = 1
"}}}


" matchup: {{{
" - https://github.com/andymass/vim-matchup
" ******************************************************
"let g:loaded_matchparen = 1
"}}}



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

"}}}


" easymotion: {{{
" ******************************************************
let g:EasyMotion_do_mapping = 0
nmap <C-g> <Plug>(easymotion-overwin-f2)
"}}}


" fzf.vim: {{{
" ******************************************************
set rtp+=/usr/local/opt/fzf
" Customize fzf colors to match your color scheme

" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }


if has('nvim')
    "let g:fzf_layout = { 'down': '~30%' }
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
else
    let g:fzf_layout = { 'window': '10split' }
endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'white'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R -f .tags'
let g:fzf_buffers_jump = 1

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ (^^)<\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-s': 'split' }

"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | call fzf#vim#history() | endif

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines / 2
  let width = float2nr(&columns - (&columns * 2 / 10))
  let row = float2nr((&lines - height) / 2)
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction


nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>G :GFiles?<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader><Tab> :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>/ :Pt<CR>
" nnoremap <silent> <C-]> :call fzf#vim#tags(expand('<cword>'))<CR>


command! -bang -nargs=* Pt
  \ call fzf#vim#grep(
  \   'pt --nogroup ' .shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" }}}


" vim-gitgutter: {{{
let g:gitgutter_sign_added              = '|'
let g:gitgutter_sign_modified           = '|'
let g:gitgutter_sign_removed            = '|'
let g:gitgutter_sign_removed_first_line = '|'
let g:gitgutter_sign_modified_removed   = '|'
"}}}


" vim-choosewin: {{{
nmap <C-w><Space> <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_overlay_clear_multibyte = 1
" }}}

" undo-tree: {{{
nnoremap <Space>u :UndotreeToggle<CR>
" }}}

" coc.nvim : {{{
" Better display for messages
set cmdheight=10
let g:LanguageClient_serverCommands = {
            \ 'vue': ['vls'],
            \ }

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <Leader>p :<C-u>CocList -A -N --top yank<cr>

"}}}

