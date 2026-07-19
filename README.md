#### Vim plugin for spectre language
https://spectrelang.org  

Install using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'angluca/spectre.vim'
```
Set lsp if you want
```vim
Plug 'yegappan/lsp'

setl omnifunc=LspOmniFunc
au filetype spectre call LspAddServer([#{
            \    name: 'spectre',
            \    filetype: ['spectre'],
            \    path: 'spectre-ls',
            \  }])
```

