" From https://www.chrisatmachine.com/Neovim/11-startify/

" Custom header [ Text to ASCII Art Generator (TAAG) ]
let g:startify_custom_header = [
	    \ ' 	     _    ___              _____ __             __  _ ____       ',
	    \ ' 	    | |  / (_)___ ___     / ___// /_____ ______/ /_(_) __/_  __  ',
	    \ ' 	    | | / / / __ `__ \    \__ \/ __/ __ `/ ___/ __/ / /_/ / / /  ',
	    \ ' 	    | |/ / / / / / / /   ___/ / /_/ /_/ / /  / /_/ / __/ /_/ /   ',
	    \ ' 	    |___/_/_/ /_/ /_/   /____/\__/\__,_/_/   \__/_/_/  \__, /    ',
	    \ ' 	                                                      /____/     ',
	    \]

" Startify Menu List
let g:startify_lists = [
	    \ { 'type': 'files',     'header': ['   Files']             },
	    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()]  },
	    \ { 'type': 'sessions',  'header': ['   Sessions']        },
	    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
	    \]

" Bookmarks
let g:startify_bookmarks = [
	    \ { 'b': '~/.bashrc'  },
	    \ { 'v': '~/.vimrc'  },
	    \ { 't': '~/.tmux.conf'  },
	    \ { 'w': '~/VimWikiNotes/Courses/UdeM.md' },
	    \ { 'd': '~/VimWikiNotes/Logs/index.md' },
	    \ { 'r': '~/VimWikiNotes/Rant/index.md' },
	    \]

" Startify Configs
let g:startify_session_dir = '~/.config/nvim/session'
" let g:startify_session_autoload = 1
" let g:startify_session_persistence = 1
" let g:startify_change_to_vcs_root = 1
" let g:startify_session_delete_buffers = 1
" let g:startify_enable_special = 0
