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

	autocmd BufRead,BufNewFile *.css setf css
	autocmd BufRead,BufNewFile *.sass setf sass
	autocmd BufRead,BufNewFile *.scss setf scss
	autocmd BufRead,BufNewFile *.styl setf stylus

	autocmd BufRead,BufNewFile *.js setf javascript
	autocmd BufRead,BufNewFile *.ts setf typescript
	autocmd BufRead,BufNewFile *.coffee setf coffeescript

	autocmd BufRead,BufNewFile *.php,*.ctp setf php
	autocmd BufRead,BufNewFile *.rb setf ruby
	autocmd BufRead,BufNewFile *.py setf python
	autocmd BufRead,BufNewFile *.vim setf vim

	autocmd BufRead,BufNewFile .zsh setf zsh
	autocmd BufRead,BufNewFile COMMIT_EDITMSG setf gitcommit
augroup END
