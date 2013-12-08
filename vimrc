filetype off
call pathogen#infect()
call pathogen#helptags()

" for python_syntax file
let g:python_highlight_all="true"

" load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


"vim is being slow this might fix it
let loaded_matchparen = 1

set tabstop=4
set shiftwidth=4

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

set incsearch

" this lets me use the mouse but can screw up cutting and pasting
" see
" http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
" summary holding shift cutting and pasting can help
set mouse=a

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
" map <Leader>a <esc>:A<cr>

" for omnicppcomplete
" TODO
" map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" TODO
" for cscope (ex finding calls of function)
" map <C-F10> :!cscope -Rbq . <CR>

" TODO
" map <Leader>w <C-w><C-w>
" this stuff is for minibuffer.vim, if i don't like plugin, can erase
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"
colorscheme chela_light

nmap <leader>w :mksession! ~/session.vim<cr>
nmap <leader>l :source ~/session.vim<cr>

" for clearing highlighting after search. a lot easier than
" searching on random garbage
nnoremap <leader><space> :noh<cr>

" fix Vim’s horribly broken default regex “handling” by automatically inserting
" a \v before any string you search for. This turns off Vim’s crazy default
" regex characters and makes searches use normal regexes.
nnoremap / /\v
vnoremap / /\v

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" ---------------------------------------
" stuff for pymode
" ---------------------------------------
"Trim unused whitespaces on save
" let g:pymode_trim_whitespaces = 1
let g:pymode_trim_whitespaces = 0

"Fast and usual python folding in Vim.
"Enable pymode folding
let g:pymode_folding = 0

"Turns on the documentation script
let g:pymode_doc = 0

"Turn on code checking
let g:pymode_lint = 0

" Check code on every save (if file has been modified)
let g:pymode_lint_on_write = 0

" Check code when editting (onfly)
let g:pymode_lint_on_fly = 0

" Turn on the rope script
let g:pymode_rope = 1

" Regenerate project cache on every save (if file has been modified)
let g:pymode_rope_regenerate_on_write = 1

" pymode-completion
" By default you could typing <Ctrl-Space> for autocompletion. Will be
" automatically selected first entry and you can press <Return> to insert in
" your code. <C-X><C-O> and <C-P>/<C-N> works too
" Turn on code completion support in the plugin
let g:pymode_rope_completion = 1
" Turn on autocompletion when you typing a period
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_goto_definition_bind = '<C-c>g'
"Command for open window when definition has been finded
"Values are (`e`, `new`, `vnew`)                  'g:pymode_rope_goto_definiti on_cmd'
let g:pymode_rope_goto_definition_cmd = 'new'

" ---------------------------------------
" stuff for ctrlp
" ---------------------------------------
" default
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
" to start ctrp
"let g:ctrlp_map = '<leader>p'
