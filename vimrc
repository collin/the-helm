execute pathogen#infect()

" Core Vim
autocmd VimEnter * set ts=2 sw=2 expandtab
syntax on
filetype plugin indent on
set backspace=indent,eol,start
colorscheme default
set nu
set hlsearch
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*

" Syntastic Settings
map <c-l> :<C-u>call ToggleErrors()<CR>
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

" Nerdtree Settings
function! StartUp()
  if 0 == argc()
    NERDTree
  end
endfunction

autocmd VimEnter * call StartUp()
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

let g:UltiSnipsEditSplit="vertical"
au FileType javascript :UltiSnipsAddFiletypes javascript-jasmine

" YouCompleteMe (UltiSnips Compat)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Indent Guides
autocmd VimEnter * IndentGuidesEnable

" Cursor/Line Highlighting
autocmd VimEnter * hi CursorLine cterm=NONE ctermbg=254
autocmd VimEnter * hi CursorColumn cterm=NONE ctermbg=254

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END


" Markdown
autocmd VimEnter *.md set wrap linebreak nolist formatoptions-=t

" Whitespace
autocmd BufWritePre * StripWhitespace
