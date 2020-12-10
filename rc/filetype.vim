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
" Filetype configure
" *****************************************

augroup filetypedetect
    autocmd!
    autocmd BufRead,BufNewFile *.md setf markdown
    autocmd BufRead,BufNewFile *.txt setf text
    autocmd BufRead,BufNewFile *.csv setf csv
    autocmd BufRead,BufNewFile *.json setf json
    autocmd BufRead,BufNewFile *.xml setf xml
    autocmd BufRead,BufNewFile *.svg setf svg

    autocmd BufRead,BufNewFile *.html setf html
    autocmd BufRead,BufNewFile *.ejs setf html
    autocmd BufRead,BufNewFile *.jade setf jade
    autocmd BufRead,BufNewFile *.pug setf pug

    autocmd BufRead,BufNewFile *.css setf css
    autocmd BufRead,BufNewFile *.sass setf sass
    autocmd BufRead,BufNewFile *.scss setf scss
    autocmd BufRead,BufNewFile *.styl setf stylus

    autocmd BufRead,BufNewFile *.js setf javascript
    autocmd BufRead,BufNewFile *.vue setf vue
    autocmd BufRead,BufNewFile *.ts setf typescript
    autocmd BufRead,BufNewFile *.coffee setf coffeescript

    autocmd BufRead,BufNewFile *.php,*.ctp setf php
    autocmd BufRead,BufNewFile *.rb setf ruby
    autocmd BufRead,BufNewFile *.py setf python
    autocmd BufRead,BufNewFile *.rs setf rust
    autocmd BufRead,BufNewFile *.kt setf kotolin
    autocmd BufRead,BufNewFile *.c setf c
    autocmd BufRead,BufNewFile *.lua setf lua
    autocmd BufRead,BufNewFile *.go setf go
    autocmd BufRead,BufNewFile *.vim,vimrc setf vim

    autocmd BufRead,BufNewFile *.log setf log
    autocmd BufRead,BufNewFile *.cfg setf yaml
    autocmd BufRead,BufNewFile *.yml setf yaml
    autocmd BufRead,BufNewFile *.toml setf toml

    autocmd BufRead,BufNewFile .zsh setf zsh
    autocmd BufRead,BufNewFile *.fish setf fish
    autocmd BufRead,BufNewFile fishfile setf fish
    autocmd BufRead,BufNewFile COMMIT_EDITMSG setf gitcommit
    autocmd BufRead,BufNewFile COMMIT_EDITMSG colorscheme deus
augroup END

" Turn off diff mode automatically
augroup DiffAutocommands
  autocmd!
  autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&diff')) == 1 | diffoff | endif
augroup END
