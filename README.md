# Dotfiles

Keeping track of my Dotfiles by using symlink

## Table of Contents

1. [Requirements](#requirements)
2. [Setting Up dotfiles](#setup)
3. [What does .vimrc do](#what)
4. [Troubleshooting](#troubleshooting)
5. [Ressources](#ressources)

## Requirements

- [X] Download Plugin manager from junegunn/vim-plug: `` curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ``
- [X] Download tmux plugins manager: [here](https://github.com/tmux-plugins/tpm)
- [X] Enable Symbolic Links on Git Bash: ``export MSYS=winsymlinks:nativestrict``

- [X] Download nodejs for coc.nvim: `` sudo apt-get install nodejs``

- [X] Make vim a core editor: `` git config --global core.editor "vim"``
- [X] Download pdflatex to compile latex files: `` sudo apt-get pdflatex``
- [X] Installing `zsh`: [here](https://dev.to/yogeshdev/make-your-unix-terminal-beautiful-productive-c1d)


## ToDos

**Trobleshoot**

- [.] When installing a new plugin with `:PlugInstall`, it doesn't show in `:scriptnames` so we can't use the functions from that plugins. doesn't work with lua

**Features**

- [ ] use `beamerthemeNord` as pandoc template
- [ ] configure i3 window manager
- [ ] Add `mathjax` and `latex` in vimwiki (see [this](https://www.rosipov.com/blog/custom-templates-in-vimwiki/))
- [ ] reformat text justified with [vim-pencil](https://github.com/preservim/vim-pencil)
- [ ] [vim-wordy](https://github.com/preservim/vim-wordy)
- [ ] IntelliJ like: show function name on bracket/parenthesis 
- [ ] Task Manager [girok](https://github.com/noisrucer/girok)


## Setting Up Dotfiles

#### Step 1: Download requirements

`` ./requirements.sh``

#### Step 2: Generate Symbolic Links

`` ./install.sh ``

#### Step 3: Install Plugin inside .vimrc file
`` :PlugInstall ``


## What does the setup do?

- [X] Matrix Style background: ``cmatrix``
- [ ] Task Automation with autosys: autorep, .jil, sentevent


## What does .vimrc do

Plugins:
- [X] Git Integration: add hunks with gitgutter ``<leader>hs``
- [X] File System Explorer with NERDTree and ``<leader>n``
- [X] Revert to old code base with undotree and ``<leader>u``
- [X] View functions and import generated by ctags with tagbar ``<leader>t``
- [X] Autocomplete with coc.nvim: python, rust, c
- [X] Fuzzy file finder with fzf ``<c-f>``
- [X] Snippets with ultisnips
- [X] Docstring generator with doge and vim-python-docstring using `<leader>gd` and `<leader>gp`
- [X] Latex Compiler with vimtex using ``<leader>lc``
- [X] Debugger with vimspector and ``<leader>dd``
- [X] Check and Uncheck checkboxes with bullets.vim ``<leader>x``
- [X] Jump to file reference with startify ``gf``
- [X] Jump to functions definition and reference with coc.nvim ``gd`` and ``gr``
- [X] Personnal Notes to HTML with vimwiki using ``<leader>wa``, `` <leader>ws ``, `` <leader>w<leader>w``, `` <leader>w<leader>i``, ``<leader>ws``, `` <leader>wt``
- [X] Search through code in buffer with Ack using ``<leader>sa``
- [X] PDF file viewer with evince (zathura is another option)
- [X] Converting markdown file to pdf with pandoc using ``pandoc file.md -o file.pdf``
- [X] Ag, Rg, LustyBuffer
- [X] Window Manager with dwm or i3 (tmux)
- [X] Preview Picture and Videos with ranger
- [X] swap CAPS with esc: ```crontab -e; @reboot setxkbmap -option caps:swapescape```
- [X] Using `sioyek` to view PDF smartly: `flatpak run com.github.ahrm.sioyek`
- [X] Using `lobster` to watch TV shows and movies
- [X] Using [`jerry`](https://github.com/justchokingaround/jerry/) to watch anime and read mangas
    - modify token at file `$HOME/.local/share/jerry/anilist_token.txt`
- [X] Downloading books with `libgen-downloader`
- [X] Reading ebooks using `fbreader`
- [X] Reading RSS feed using `newsboat`
- [X] Reading mangas with [`mangal`](https://github.com/metafates/mangal)
- [ ] Configure powerline: `powerline-config tmux setup`

Native:
- [X] Mappings Refractor
- [X] Navigating through errors using quickfix with ``:cn, :cp``
- [X] Global and local rename with ``<leader>a``
- [X] Using Buffers and Registers to yank previous entries with
      ``"<letter>yy`` and ``"<letter>p``
- [X] Using Ticks to save local file position with `` '<letter>`` and ``m<letter>``
- [X] Macros Integration with ``q<letter>`` and ``@<letter>``
- [X] Execute python script inside vim with ``<F7>``
- [X] Spelling Checker for Markdown files with errors fix suggestions with ``z=`` in normal mode
- [X] Open ``.vimrc`` file anywhere with ``<leader>ev``
- [X] Go to top, mid, bottom file with ``zt``, ``zz`` and ``zb``
- [ ] Move screen whilst keeping the cursor at the same spot with `<ctrl-e>` and `<ctrl-y>`
- [X] Increment and decrement next number with ``<c-a>`` and ``<c-x>``
- [X] Using [folds](https://bitcrowd.dev/folding-sections-of-markdown-in-vim)
- [X] setup thesaurus: [here](https://www.thegeekstuff.com/2008/12/vi-and-vim-editor-3-steps-to-enable-thesaurus-option/)
- [X] see synonym thesaurus
- [X] Ebook converter with `calibre`

## Tmux Keybindings

- Current key binding: ``<c-s>``

#### Session and Window Preview

- Session and Window Preview: ``<c-b>w``

#### Windows

- Create Window: ``<c-b>c``
- Close currente Window: ``<c-b>&`` or ``<c-d>``
- Move to previous and next window: ``<c-b>p`` and ``<c-b>n``
- Full Screen: `F11`

#### Panes

- Split pane horizontally and vertically: ``<c-b>% or -`` and ``<c-b>" or |``
- Move pane: ``<c-b>{}``
- Switch to pane: ``<c-b><arrow-key>`` or ``<c-b>o``
- Convert pane to window: ``<c-b>!``
- Resize Panes: ``<c-b><c- 'arrow-key'>``

#### Utilities

- Copy Pasting on tmux:  `<c-s>[` and `<c-s>]`


## One Drive Integration

- [X] Install InSync
- [X] Install One Note 
- [ ] Use Immersive Reader by Converting PDF file to .docx file

[White screen in One Note](https://github.com/anujdatar/onenote-desktop/issues/25)

## Installing Autosys for task scheduling automation


## How to add LatexMathML inside vimwiki

After seeing [this](https://www.rosipov.com/blog/custom-templates-in-vimwiki/) and 
[this](https://www.maths.nottingham.ac.uk/plp/pmadw/lm.html), 

to add latex inside vimwiki, add js script inside `.vim/plugged/vimwiki/autoload/vimwiki/default.tpl`

For more information, see `:h vimwiki` -> `vimwiki-syntax-math`

```
  <script type="text/javascript"
  src="https://www.maths.nottingham.ac.uk/plp/pmadw/LaTeXMathML.js">
  </script>
```

## Go to apps for different OS

**General**

- vimium: use vim shortcut in chrome
- [excalidraw](https://excalidraw.com/)
- [witeboard](https://witeboard.com/)
- [draw.io]


**MacOS**

- system manager: RayCast
    * extensions: chrome, slack, visual studio code, arc, perplexity, github, obsidian
- window tiling system: [Rectangle](https://rectangleapp.com/)


## Ressources


- [learn vim the hard way](https://learnvimscriptthehardway.stevelosh.com/)

- [How to Open a PDF in Word and use Immersive Reader](https://www.youtube.com/watch?v=dCAPOExjfb8)

- [Dotfiles Management by Fireship](https://www.youtube.com/watch?v=r_MpUP6aKiQ&t=510s)
- [Splitting .vimrc file](https://vi.stackexchange.com/questions/5441/is-it-possible-and-useful-to-split-vimrc)
- [Enabling Symbolic Links in Git Bash](https://github.community/t/git-bash-symbolic-links-on-windows/522/11)
- [Installing zsh](https://dev.to/zinox9/installing-zsh-on-windows-37em)
- [Download Unofficial Vim 8.2](https://itsfoss.com/vim-8-release-install/)
- [Setting up Jupyter Notebook with Python on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-set-up-jupyter-notebook-with-python-3-on-ubuntu-18-04)
- [Modern Coder's install fzf on terminal](https://www.youtube.com/watch?v=1a5NiMhqAR0)
- [vim-galore](https://github.com/mhinz/vim-galore)
- [Install Jupyter notebook](https://speedysense.com/install-jupyter-notebook-on-ubuntu-20-04/)
- [Tmux CheatSheet](https://tmuxcheatsheet.com/)
- [Vimwiki CheatSheet](http://thedarnedestthing.com/vimwiki%20cheatsheet)
- [Evince Shortcuts](htps://defkey.com/evince-shortcuts)
- [Vim after 15 years - Ian Langworth](https://statico.github.io/vim3.html)

**Pandoc**

- [beamertheme gallery](https://deic.uab.cat/~iblanes/beamer_gallery/index.html)
- [ultimate-beamer-theme-list](https://github.com/martinbjeldbak/ultimate-beamer-theme-list)
- [bulding prettry slides using markdown and pandoc - Andrea Valenza](https://avalz.it/blog/notes/build-pretty-slides/)
- [pandoc beamer how to ](https://github.com/alexeygumirov/pandoc-beamer-how-to)


- [metropolis theme](https://github.com/matze/mtheme)
- [beamerthemenord](https://github.com/junwei-wang/beamerthemeNord)
- [bracken theme](https://www.overleaf.com/latex/templates/beamer-template-by-cameron-bracken/gmgmqwprthxb)
- [montpellier rose professionalfonts theme](https://deic.uab.cat/~iblanes/beamer_gallery/individual/Montpellier-rose-professionalfonts.html)

**newsboat and RSS**

- [newsboat doc](https://newsboat.org/releases/2.33/docs/newsboat.html)
- [newsboat configs](https://newsboat.org/releases/2.33/docs/newsboat.html#_newsboat_configuration_commands)
- [How I watch Youtube with newsboat](https://archive.org/details/hpr3695)
- [RSS Filtering with newsboat - Brodie Robertson](https://www.youtube.com/watch?v=UctJ1IHTW04)

**mangal**

- [mangal query json](https://github.com/metafates/mangal/wiki/Inline-mode)

**oh-my-posh**

- [ohmyposh](https://ohmyposh.dev/)

**VSCode Extensions**

- Github
    * Github Pull Requests
    * Git Blame
- Better Comments

