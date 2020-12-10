" *****************************************
"
"      _/\/\____/\/\_/\/\__________________
"     _/\/\____/\/\________/\/\/\__/\/\___ 
"    _/\/\____/\/\_/\/\___/\/\/\/\/\/\/\_  
"   ___/\/\/\/\___/\/\___/\/\__/\__/\/\_   
"  _____/\/\_____/\/\/\_/\/\______/\/\_    
" ____________________________________     
"
" LAST UPDATE: 2019-03-06
"
" Keymap configure
"
" *****************************************

let mapleader = "\<Space>"

" for USkey
nnoremap ; :

noremap <Space>v :source ~/.vim/vimrc<CR>

inoremap <silent> jj <ESC>
onoremap <silent> jj <ESC>
inoremap <silent> j<Space> j
onoremap <silent> j<Space> j

" 検索結果ハイライト解除
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>


" jkでのカーソルを表示行単位で移動できるように変更
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> gj j
noremap <silent> gk k

" 次の検索候補を画面の中心に表示
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" 改行
inoremap <C-CR> <ESC>o
inoremap <S-CR> <ESC>o
inoremap <C-S-CR> <ESC>O

" ショートカット移動
nnoremap <Space>h  ^
nnoremap <Space>l  $
nnoremap <Space>j  }
nnoremap <Space>k  {

" 置換のテンプレート入力
nnoremap gs  :<C-u>%s///g<Left><Left><Left>
vnoremap gs  :s///g<Left><Left><Left>

" 日付の入力
" inoremap <Leader>d  <C-r>=strftime('%Y-%m-%d')<Return>

" ウィンドウ分割時にウィンドウサイズを調節する。Shiftキー ＋ 矢印キー
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>

" タブ
noremap <silent> gn :tabnew<CR>
noremap <silent> gh gT
noremap <silent> gl gt

" バッファ
nnoremap <silent> <C-p> :bprevious<CR>
nnoremap <silent> <C-n> :bnext<CR>
nnoremap <silent> <C-b> :b#<CR>

inoremap <silent> =\ <C-r>=
" Visualモードでインクリメント/デクリメントを連続でできるように
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

nnoremap <Space><ESC> ToggleRelativeNumber
