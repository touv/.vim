" ----------------------------------------------------------------
"           _
"    _   __(_)___ ___  __________
"   | | / / / __ `__ \/ ___/ ___/
"  _| |/ / / / / / / / /  / /__
" (_)___/_/_/ /_/ /_/_/   \___/
"
" -----------------------------------------------------------

" {{{ Plugin
" -----------------------------------------------------------
call plug#begin('~/.vim/bundle')
Plug 'gmarik/vundle'

" From github

" réglages de bases partagés par beaucoup
Plug 'tpope/vim-sensible'

" coloration syntaxique pour la documentatino api blueprint
Plug 'kylef/apiblueprint.vim'

" jeu de couleurs
Plug 'croaker/mustang-vim'
"Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
"Plug 'endel/vim-github-colorscheme'

" coloration syntaxique pour jade
" Plug 'digitaltoad/vim-jade'
"Plug 'posva/vim-vue'

" coloration syntaxique pour less
Plug 'groenewege/vim-less'

" coloration syntaxique pour jst
"Plug 'briancollins/vim-jst'

" coloration syntaxique pour markdown
Plug 'tpope/vim-markdown'

" coloration syntaxique pour asciidoc
"Plug 'dagwieers/asciidoc-vim'

" coloration syntaxique pour reStructuredText
"Plug 'vim-scripts/rest.vim'

" coloration syntaxique pour pro c
"Plug 'vim-scripts/proc.vim'

" coloration syntaxique pout txt2tags
"Plug 'vim-scripts/a-new-txt2tags-syntax'


" correction syntax pour plusieurs langages
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

" gestion des commentaires pour plusieurs languages
Plug 'scrooloose/nerdcommenter'

" pour entrourer ou détrouer des mots/paragrpahe etc.
Plug 'tpope/vim-surround'

" ...
Plug 'tpope/vim-unimpaired'

" des barres en couleur et sympa status, buffer, tabs, etc.
Plug 'bling/vim-airline'

" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace'

" affiche les numéros ligen à partir la ligne courant
"Plug 'myusuf3/numbers.vim'

" recherche rapide dans des fichiers
"Plug 'ctrlpvim/ctrlp.vim'

" Visualise les indentations par des couleurs
" Plug 'nathanaelkane/vim-indent-guides'

" JSON highlighting and quote concealing
Plug 'elzr/vim-json'

" JavaScript syntax
"Plug 'jiangmiao/simple-javascript-indenter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'othree/yajs.vim'

" Syntax highlighting for well-known JS libraries
Plug 'othree/javascript-libraries-syntax.vim'

" CSS3 syntax
Plug 'hail2u/vim-css3-syntax'

" HTML5 syntax
Plug 'othree/html5.vim'

" gestion mutlicursor
Plug 'terryma/vim-multiple-cursors'

" visualise directment le code d'une couleur
Plug 'skammer/vim-css-color'

" Permet de faire de rechercher la sélection visuelle
Plug 'nelstrom/vim-visual-star-search'

" Affiche les tags du fichier courant
Plug 'majutsushi/tagbar'

" Edit the file with an existing Vim if possible
"Plug 'svintus/vim-editexisting'

" Pour tricher un peu
Plug 'touv/vim-arrow'

" vimrc by directory
Plug 'thinca/vim-localrc'

call plug#end()
" }}}

" {{{ Encodage et format par défaut
" -----------------------------------------------------------
set encoding=utf8
set fileformats=unix,dos,mac
set fileencoding=utf-8
scriptencoding utf-8
" }}}

" {{{ General
" -----------------------------------------------------------

" bundle/sensible do that : set backspace=2     " enable backspace to delete anyting (includes \n) in insert mode
" bundle/sensible do that : set showmatch       " Quand on tape un ), vim montre furtivement le ( correspondant.
" bundle/sensible do that : set showcmd
" bundle/sensible do that : syntax on                       " Active la coloration syntaxique quand c'est possible

set nocompatible    " be iMproved
set hidden          " Cache les buffers à la place des les décharger
set autochdir       " Set working directory to the current file
set nocompatible    " On n'assura pas la compatiblité avec VI et c'est tant mieux !
set noerrorbells    " ne fait pas un bip lors d'une erreur
set visualbell      " Fait clignoter l'écran lors d'une erreur de saisie, de commande etc...
set foldcolumn=2    " Ajoute une marge à gauche pour afficher les +/- des replis
set undolevels=2000 " Nombre maximum de changements qui peuvent être annulés
set spelllang=fr,en " Langue de correction par défaut
set title           " donne un titre aux fenetres xterm
set number          " affiche les numéros de ligne
set nowrap          " pas de retour à la ligne automatique
set nojoinspaces    " J command doesn't add extra space
set sidescroll=5    " (lié à nowrap) nombre minimum de colonnes qui défilent horizontalement
set scrolloff=1     " commence le défilement vertical N lignes avant
set tags=tags;~/    " Look for the file in the current directory, then south until you reach home.

"set foldcolumn+=a   " reformatage automatique
"set textwidth=80    " largeur du text
"set wrapmargin=2   " Marge avant coupure
" }}}

" {{{ Look & feel
" -----------------------------------------------------------
if has('gui_running')
	set guioptions-=T               " supprime la barre d'outils
	"colorscheme Tomorrow
	colorscheme zellner
	set cursorline
	set cursorcolumn
	"hi CursorLine guibg=#FFEFFF
	"hi CursorColumn guibg=#FFEFFF
else
	colorscheme mustang
end
" }}}

" {{{ Caractères invisibles
" -----------------------------------------------------------
" Use the same symbols as TextMate for tabstops and EOLs
"set list
set listchars=eol:¬
set listchars+=tab:→\ 
set listchars+=trail:·
set listchars+=extends:»              " show cut off when nowrap
set listchars+=precedes:«
set listchars+=nbsp:⣿
" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" }}}

" {{{ Commentaires
" -----------------------------------------------------------
set com&
set com^=sr:*\ -,mb:*\ \ ,el:*/ com^=sr://\ -,mb://\ \ ,el:///
" }}}

" {{{ Indentation
" -----------------------------------------------------------
set shiftwidth=4   " Nombre d'espace pour une tabulation
set softtabstop=4  " if non-zero, number of spaces to insert for a <tab>
set tabstop=4      " number of spaces the tab stands for
set noexpandtab    " Tabulation ne génére pas des espaces
" }}}

" {{{ Searching, Substituting, Completion
" -----------------------------------------------------------
set ignorecase    " On ignore la casse des caractères dans les recherches de chaînes.
set scs           " No ignorecase if Uppercase chars in search
set magic         " change the way backslashes are used in search patterns
set wrapscan      " begin search at top when EOF reached
set sm            " jump to matches during entering the pattern
set hls           " highlight all matches...
" bundle/sensible do that : set incsearch     " ...and also during entering the pattern


set infercase
set complete=.,w,b,u,U,t,i
set completeopt=menu,preview,menuone
"set omnifunc=syntaxcomplete#Complete
"set completefunc=syntaxcomplete#Complete
" }}}

" {{{ Optimization
" -----------------------------------------------------------
set ttyfast       " Indicates a fast terminal connection
set nofsync       " improves performance -- let OS decide when to flush disk
" }}}

" {{{ Statusline
" -----------------------------------------------------------
" bundle/sensible do that : set wildmenu							 " show a list of all matches when tabbing a command
" bundle/sensible do that : set history=200							 " remember last 2000 typed commands
" bundle/sensible do that : set ruler								 " show cursor position below each window
" bundle/sensible do that : set laststatus=2						 " show always statusline of last window
set wildchar=<TAB>														 " use tab for auto-expansion in menus
set wildmode=list:longest,list:full									 " how command line completion works
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz						 " ignore some files for filename completion
set wildignore+=*.*~,*~
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set wildignore+=*.swp,.lock,.DS_Store,._*,tags.lock
set wildignore+=*.min.*
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.jar,*.pyc,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set su=.h,.bak,~,.o,.info,.swp,.obj									 " some filetypes got lower priority
set showmode														 " shows the current status (insert, visual, ...) in statusline
set shortmess=at													 " Abréviation des messages
" }}}

" {{{ Souris
" -----------------------------------------------------------
if has("gui_running")
	set mousef                      " Le focus suit la souris
	set mousemodel=popup_setpos     " Le bouton droit affiche une popup
endif
set mouse=a                         " Utilisation de la souris dans les terminaux qui le peuvent
set mousehide                       " Hide the mouse cursor while typing
" }}}

" {{{ Clipboard -- use os clipboard
" -----------------------------------------------------------

set pastetoggle=<F12>

if empty($SSH_CONNECTION) && has('clipboard')
  set clipboard^=unnamed                " Use vim global clipboard register
  if has('unnamedplus') || has('nvim')  " Use system clipboard register
    set clipboard^=unnamedplus
  endif
endif
" }}}

" {{{ Fenetres
" -----------------------------------------------------------
set wh=1                " minimal number of lines used for the current window
set wmh=0               " minimal number of lines used for any window
set noequalalways       " make all windows the same size when adding/removing windows
set splitbelow          "a new window is put below the current one
set splitright
set fillchars=vert:│    " Vertical sep between windows (unicode)
" reveal already opened files from the quickfix window instead of opening new
" buffers
set switchbuf=useopen
set nostartofline       " don't jump to col1 on switch buffer
" }}}

" {{{ Sauvegarde
" -----------------------------------------------------------
set backupdir=~/.backup,/tmp        " Répertoire de sauvegarde automatique
set backup                          " On active la sauvagarde
let g:savevers_dirs = &backupdir      " Même répertoire de sauvegarde que pour le backup classique
"set updatecount=0                  " Supprime l'utilisation du fichier d'échange
" }}}

" {{{ Mapping
" -----------------------------------------------------------

let mapleader = ","            " , is easier to type than \

" Selection tout le fichier
map <C-a> ggVG

" CTRL+PAGEUP / CTRL+PAGEDOWN pour circuler entre les Tampons
nnoremap <C-PageDown> :bn!<CR>
nnoremap <C-PageUp> :bp!<CR>

" CTRL+q : fermeture forcer d'un tampon
map <C-q> :bd!<cr>
imap <C-q> <C-O>:bd!<cr>
cmap <C-q> <c-c>:bd!<cr>

" Indentation automatique (Emacs's style)
vnoremap <tab>   =
nnoremap <tab>   =$

" Highlight all occurences of the current word with SHIFT+* (µ on azerty)
nnoremap µ :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Affiche les caractères spéciaux
nmap <F2> :set list!<CR>

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

"Toggle Spell check
nnoremap <F10>	  :set spell! spell?<CR>
imap     <F10>	  <C-o><F10>
vmap     <F10>	  <C-c><F10>

noremap <leader>s :FixWhitespace<CR>

"Toggle Spell check
nnoremap <F10>	  :set spell! spell?<CR>
imap     <F10>	  <C-o><F10>
vmap     <F10>	  <C-c><F10>

" Analyse du code
nmap <F12> :SyntasticCheck<CR>
nmap <C-F12> :SyntasticInfo<CR>

" }}}

" {{{ Commandes & functions
" -----------------------------------------------------------

" Converts file format to/from unix
command Unixformat :set ff=unix
command Dosformat :set ff=dos

" }}}

" {{{ Commande Automatique
" -----------------------------------------------------------
if has("autocmd")

	" {{{ Template
	"au BufNewFile *.xsl 0r~/.vim/templates/xsl.xsl
	au BufNewFile *.xml 0r~/.vim/templates/xml.xml
	au BufNewFile *.html 0r~/.vim/templates/html.html
	au BufNewFile *.c 0r~/.vim/templates/c.c
	au BufNewFile *.php 0r~/.vim/templates/php.php
	" }}}

	" {{{ Configuration par type
	autocmd FileType text setlocal textwidth=78 nocindent
	autocmd FileType c,cpp,slang setlocal cindent
	autocmd FileType css setlocal smartindent expandtab ts=2 sts=2 sw=2
	autocmd FileType html setlocal formatoptions+=tl expandtab ts=2 sts=2 sw=2
	autocmd FileType javascript setlocal formatoptions+=tl expandtab ts=2 sts=2 sw=2
	autocmd FileType php setlocal cindent expandtab  ts=4 sts=4 sw=4 keywordprg=pman makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
	" }}}

	" {{{ Traitement des extentions particulières
	autocmd BufNewFile,BufRead *.t2t setfiletype txt2tags
	autocmd BufNewFile,BufRead *.rss,*.atom,*.xul setfiletype xml
	autocmd BufNewFile,BufRead *.rst set syntax=rest
	autocmd BufNewFile,BufRead *.pc set syntax=html ft=proc
	"autocmd BufNewFile,BufRead *.ejs setfiletype html.js
	" }}}

	" {{{ Divers
	"    autocmd BufRead *\[[0-9]] set syntax=html filetype=html
    autocmd BufEnter * lcd %:p:h   " change to directory of current file automatically
	" }}}

endif

"}}}

" {{{ Pour NERDCommenter
" -----------------------------------------------------------
let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
" }}}

" {{{ Pour visual-star-search
" -----------------------------------------------------------
function! s:VSetSearch(cmdtype)
	  let temp = @s
	  norm! gv"sy
	  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	  let @s = temp
endfunction
" In visual mode when you press * or # to search for the current selection (nécessite visual-star-search)
" http://vimcasts.org/episodes/search-for-the-selected-text/
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" }}}

" {{{ Pour Man
" -----------------------------------------------------------
source $VIMRUNTIME/ftplugin/man.vim          " Active la commande :Man
" }}}

" {{{ Pour PHP
" -----------------------------------------------------------
let php_sql_query = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
let php_folding = 1
" }}}

" {{{ Pour Syntastic
" -----------------------------------------------------------
"set statusline+=%{SyntasticStatuslineFlag()}
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['php', 'javascript', 'xml', 'xslt'], 'passive_filetypes': ['html.js', 'html'] }
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" }}}

" {{{ Airline
" -----------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
" }}}

" {{{ Pour vim-css-color
" -----------------------------------------------------------
let g:used_javascript_libs = 'jquery,underscore,react,handlebars,vue,d3'  "javascript-libraries-syntax.vim
let g:cssColorVimDoNotMessMyUpdatetime = 1 "vim-css-color
" }}}

" vim:fdm=marker
