vim-tig
=======

Provide a handy command to use [tig](https://github.com/jonas/tig) from the neovim terminal.

Feature
-------

-	currently
	-	neovim only
	-	executes `tig status` in neovim's vsplit terminal
	-	don't nest commit editor(if you have [neovim-remote](https://github.com/mhinz/neovim-remote)\)
-	future
	-	works with both vim and neovim
	-	add new command following other tig's subcommand

Usage
-----

```
:Tig
```

Installation
------------

For [vim-plug](https://github.com/junegunn/vim-plug) plugin manager:

```
Plug 'devoc09/vim-tig'
```

Configuration
-------------

```
" Start up in status view (default)
let g:start_status_view = 1
" Start up in tig view (no subcommand)
let g:start_status_view = 0
```

Requirements
------------

-	tig
-	neovim (author's env is neovim-v0.6.0)
-	neovim-remote (option)
