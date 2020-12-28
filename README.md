# Config dein.vim

Thanks TK-san!!

```sh
$ git clone https://github.com/gitkado/config_vim .vim
$ vim
```

## Plugin Update

```sh
$ vim
:call map(dein#check_clean(), "delete(v:val, 'rf')")
:call dein#recache_runtimepath()
```

[Link](https://hodalog.com/how-to-remove-plugin-using-dein/)
