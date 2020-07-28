set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'SirVer/ultisnips' | Plugin 'honza/vim-snippets'
Plugin 'rdnetto/ycm-generator'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode'
Plugin 'junegunn/fzf'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wincent/terminus'
Plugin 'nvie/vim-togglemouse'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'thosakwe/vim-flutter'
Plugin 'natebosch/vim-lsc'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'yggdroot/indentline'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'natebosch/vim-lsc-dart'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'preservim/nerdcommenter'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'herringtondarkholme/yats.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Shougo/deoplete.nvim',{'do':':UpdateRemotePlugins'}
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'neoclide/coc.nvim',{'do': 'yarn install --frozen-lockfile'}
Plugin 'joshdick/onedark.vim'
Plugin 'rafi/awesome-vim-colorschemes'

call vundle#end()
filetype plugin indent on    " required

syntax on

set autochdir
set shell=zsh
set smarttab
set cindent
set softtabstop=4
set tabstop=4
set wrap
set shiftwidth=4
" always uses spaces instead of tab characters
set expandtab
set ma
set undodir=~/.vim/undodir
set undofile
set nu
set backspace=indent,eol,start
set linebreak
set nostartofline
set noswapfile
set confirm
set cmdheight=1
filetype indent plugin on
set wildmenu
set lazyredraw 
set incsearch
set nohlsearch
set clipboard=unnamed
set splitbelow
set cursorline
set sidescroll=1
set sidescrolloff=3
set statusline+=\ %r

"My Own Plugin

let g:nerdtree_tabs_autofind=0
nnoremap <SPACE> <Nop>
nnoremap <C-f> <Nop>
nnoremap <C-z> <Nop>
let mapleader =" "

nnoremap <leader>z :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>zz :vsp ~/.vimrc<CR>
nnoremap <silent> <leader><Up> :resize +5<CR> 
noremap <silent> <leader><Down> :resize -5<CR>
nnoremap <leader><Left> :vertical resize +6<CR>
nnoremap <leader><Right> :vertical resize -4<CR>
map <A-n> <plug>NERDTreeTabsToggle<CR>
nnoremap <silent> <leader>i :DartFmt<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-S> <C-W><C-S>
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
nnoremap <leader>v :wincmd v<CR>
map <C-t> :new<bar> :resize 12<bar> :terminal<cr>

nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR> 

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

"inoremap KeyMapping <Esc>                                                       
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


"THEME

colorscheme dracula
set background=dark
let g:airline_theme = "onedark"

"TERMINAL COLOR ENHENCER

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"COLOURFULL PARENTHESES HIGHLIGHT
"let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
"let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

"ENABLE FLUTTERMENU

"call FlutterMenu()

nnoremap <A-f> :FlutterRun
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>ff :FlutterHotReload<cr>
nnoremap <leader>fr :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>


"VIM-LSP DEFAULT KEY VALUE

"'GoToDefinition': <C-]>,
"'GoToDefinitionSplit': [<C-W>], <C-W><C-]>],
"'FindReferences': gr,
"'NextReference': <C-n>,
"'PreviousReference': <C-p>,
"'FindImplementations': gI,
"'FindCodeActions': ga,
"'Rename': gR,
"'DocumentSymbol': go,
"'WorkspaceSymbol': gS,
"'SignatureHelp': gm,

let g:lsc_auto_map = v:true

"IndentLine 
:set list lcs=tab:\|\

"COMMENT SINGLE LINE AND MULTILINE

vmap \\ <plug>NERDCommenterToggle
nmap \\ <plug>NERDCommenterToggle

"CocPlugins KeyMapings 
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <D-s> <Plug>(coc-range-select)
xmap <silent> <D-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

