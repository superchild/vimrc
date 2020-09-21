" Set vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/autoload_cscope.vim'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
Plug 'airblade/vim-gitgutter'

call plug#end()

" Basic setting
syntax on
set number
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on
:hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
:hi CursorLineNr cterm=bold ctermfg=green ctermbg=NONE

" Set ctags & cscope
set cscopetag
set csto=0
set tags=tags;/
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
    set cscopeverbose

" Set key shortcut for cscope
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Set NERDTree
nnoremap <F9> :NERDTreeToggle<CR><CR>
let NERDTreeWinPos="left"
let NERDTreeMinimalUI=1

" Set TagBar
nnoremap <F10> :TagbarToggle<CR>

" Set vim-airline
set t_Co=256
let g:solarized_termcolors=256  
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Set vim-gitgutter
let g:gitgutter_enabled = 1
