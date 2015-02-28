filetype off
call pathogen#infect()
call pathogen#helptags()

" experiment
" inoremap jk <Esc>
" noremap <Esc> <Nop>

" for python_syntax file
let g:python_highlight_all="true"

" load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" turn off ex mode
nnoremap Q <Nop>

"vim is being slow this might fix it
let loaded_matchparen = 1

set tabstop=4
set shiftwidth=4

" map j to gj and k to gk, so line navigation ignores line wrap
nnoremap j gj
nnoremap k gk

set incsearch

" this lets me use the mouse but can screw up cutting and pasting
" see
" http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
" summary holding shift cutting and pasting can help
"set mouse=a
" disable mouse
set mouse=
nnoremap <leader>m :set mouse=a<cr>
nnoremap <leader>n :set mouse=<cr>

set nocompatible
set nobackup
set noswapfile
set nowritebackup
set showcmd
set hls
"This specifies where in Insert mode the <BS> is allowed to delete the
"character in front of the cursor.  The three items, separated by commas, tell
"Vim to delete the white space at the start of the line, a line break and the
"character before where Insert mode started.
set backspace=indent,eol,start
"This makes Vim use the indent of the previous line for a newly created line.
set autoindent
"Keep 1000 commands and 1000 search patterns in the history. (default is 20)
set history=1000
set ruler
set showmatch
set nospell
" Automatically save before commands like :next and :make
set autowrite
" Hide buffers when they are abandoned
set hidden


" enable syntax highlighting only when the terminal supports colors
if &t_Co > 1
   syntax enable
endif
" have Vim jump to the last position when
" reopening a file
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" makes sesssions so they can be worked on with windows and unix
set sessionoptions+=unix,slash

set wildmenu
" leader key is normally \ which sucks
let mapleader = ","
"The % key will switch between opening and closing brackets. By sourcing matchit.vim, it can also switch among e.g. if/elsif/else/end, between opening and closing XML tags, and more.
" TODO
" runtime macros/matchit.vim

" imst default for project plugin. g makes F12 toggle the project plugin
" ERASEME?
" let g:proj_flags="imstg"

"The “Press ENTER or type command to continue” prompt is jarring and usually unnecessary. You can shorten command-line text and other info tokens with, e.g.:
set shortmess=atI
"See :help shortmess for the breakdown of what this changes. You can also pare things down further if you like

" for alternative.vim. toggles between header/cpp file
" TODO
" noremap <Leader>a <esc>:A<cr>

" for omnicppcomplete
" TODO
" noremap <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" TODO
" for cscope (ex finding calls of function)
" noremap <C-F10> :!cscope -Rbq . <CR>

" TODO
" noremap <Leader>w <C-w><C-w>
" this stuff is for minibuffer.vim, if i don't like plugin, can erase
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"
colorscheme chela_light

nnoremap <leader>w :mksession! session.vim<cr>
nnoremap <leader>l :source session.vim<cr>

" for clearing highlighting after search. a lot easier than
" searching on random garbage
nnoremap <leader><space> :noh<cr>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" the Mosh uses <C-^> so remap it
noremap <leader>d <C-^>

" ---------------------------------------
" stuff for pymode
" ---------------------------------------

"  disable the entire plugin
let g:pymode = 0

"Trim unused whitespaces on save
" let g:pymode_trim_whitespaces = 1
" let g:pymode_trim_whitespaces = 0

"Fast and usual python folding in Vim.
"Enable pymode folding
" let g:pymode_folding = 0

"Turns on the documentation script
" let g:pymode_doc = 0

"Turn on code checking
" let g:pymode_lint = 0

" Check code on every save (if file has been modified)
" let g:pymode_lint_on_write = 0

" Check code when editting (onfly)
" let g:pymode_lint_on_fly = 0

" Turn on the rope script
" let g:pymode_rope = 0

" Regenerate project cache on every save (if file has been modified)
" let g:pymode_rope_regenerate_on_write = 0

" pymode-completion
" By default you could typing <Ctrl-Space> for autocompletion. Will be
" automatically selected first entry and you can press <Return> to insert in
" your code. <C-X><C-O> and <C-P>/<C-N> works too
" Turn on code completion support in the plugin
" let g:pymode_rope_completion = 1
" Turn on autocompletion when you typing a period
" let g:pymode_rope_complete_on_dot = 1
" let g:pymode_rope_goto_definition_bind = '<C-c>g'
"Command for open window when definition has been finded
"Values are (`e`, `new`, `vnew`)                  'g:pymode_rope_goto_definiti on_cmd'
" let g:pymode_rope_goto_definition_cmd = 'new'

" short cut for jumping windows
nnoremap <leader>a <C-w><C-w>

" short cut for closing current window
nnoremap <leader>c <C-w>c

" short cut for changing width of windows
" the 'i' in the mapping is weird. so the cursor was also moving down
" and k offsets it
nnoremap <C-h> <C-w><k<cr>
nnoremap <C-l> <C-w>>k<cr>


" some tips from learn vimscript the hard way
" ------------------------------------------
" edit my vimrc quickly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" make it easy to import new vimrc setting easily
nnoremap <leader>sv :source $MYVIMRC<cr>

" ---------------------------------------
" stuff for Fugative plugin
" ---------------------------------------

nnoremap <leader>g :Gblame<cr>

" ---------------------------------------
" stuff for Taglist plugin
" ---------------------------------------

nnoremap <leader>t :TlistOpen<cr>

" ---------------------------------------
" stuff for tagbar plugin
" ---------------------------------------
nnoremap <leader>; :TagbarToggle<CR>



" ---------------------------------------
" stuff for ctrlp
" ---------------------------------------
" default
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
" to start ctrp
"let g:ctrlp_map = '<leader>p'
"
"

