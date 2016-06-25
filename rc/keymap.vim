" KEY MAP
let mapleader = ","
" for USkey
nnoremap ; :
inoremap jj <ESC>
onoremap jj <ESC>
inoremap j<Space> j
onoremap j<Space> j
imap <C-h> <Esc>
imap <C-j> OB
imap <C-k> OA
imap <C-l> OC
" jkでのカーソルを表示行単位で移動できるように変更
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" 改行
inoremap <C-CR> <ESC>o
inoremap <S-CR> <ESC>o
inoremap <C-S-CR> <ESC>O

nnoremap <Space>h  ^
nnoremap <Space>l  $

nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>

inoremap <Leader>dF  <C-r>=strftime('%Y-%m-%d/%H:%M:%S+09:00')<Return>
inoremap <Leader>df  <C-r>=strftime('%Y-%m-%d/%H:%M:%S')<Return>
inoremap <Leader>dd  <C-r>=strftime('%Y-%m-%d')<Return>
inoremap <Leader>dm  <C-r>=strftime('%Y-%m')<Return>
inoremap <Leader>dy  <C-r>=strftime('%Y')<Return>
inoremap <Leader>dT  <C-r>=strftime('%H:%M:%S')<Return>
inoremap <Leader>dt  <C-r>=strftime('%H:%M')<Return>
