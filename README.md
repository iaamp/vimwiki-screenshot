# vimwiki-screenshot

[Vim](https://github.com/vim/vim) plugin to easily take screenshots with [vimwiki](https://github.com/vimwiki/vimwiki) and link them.

## What it does
Takes a screenshot using a CLI screenshot program, and saves that screenshot to a configurable directory based on vimwiki-dir.
If the file exists (i.e. action not aborted), an embedded image link to that file is inserted as new line below the current line.

## Usage
* `:VimwikiScreenshot` will let you take a screenshot, saves it to `<vimwiki_path>/<vimwiki_screenshot_directory>`
* Specify a screenshot program: `let g:vimwiki_screenshot_program = <CLI call to the program accepting a destination file as arg>`
* Specify the file name format: `let g:vimwiki_screenshot_directory = <sub-directory from vimwiki-dir to place screenshots in>`
* Specify the file name format: `let g:vimwiki_screenshot_nameformat = <datetime name format, e.g. %Y-%m-%d_%H-%M-%S (default)>`

## Installation

#### Using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
" load after vimwiki/vimwiki
Plug 'iaamp/vimwiki-screenshot
```

#### Dependencies
* [vimwiki](https://github.com/vimwiki/vimwiki)
* a screenshot CLI program, e.g. [gnome-screenshot](https://gitlab.gnome.org/GNOME/gnome-screenshot)

## Known Limitations & Future Work
* currently tested only with gnome-screenshot program

#### known conflicts
* none so far, it is a very small plugin

## License

Copyright (c) Alexander Moortgat-Pick.  Distributed under the same terms as Vim itself.
See `:help license`.
