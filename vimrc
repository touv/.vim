" ----------------------------------------------------------------
"
" my vimrc
"
" -----------------------------------------------------------

" {{{ vundle
" -----------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" From github

" réglages de bases partagés par beaucou
Bundle 'tpope/vim-sensible'

" coloration syntaxique pour jade
Bundle 'digitaltoad/vim-jade'

" coloration syntaxique pour less
Bundle 'groenewege/vim-less'

" coloration syntaxique pour jst
Bundle 'briancollins/vim-jst'

" coloration syntaxique pour markdown
Bundle 'tpope/vim-markdown'

" coloration syntaxique pour asciidoc
"Bundle 'dagwieers/asciidoc-vim'

" coloration syntaxique pour reStructuredText
"Bundle 'vim-scripts/rest.vim'

" coloration syntaxique pour pro c
"Bundle 'vim-scripts/proc.vim'

" coloration syntaxique pout txt2tags
"Bundle 'vim-scripts/a-new-txt2tags-syntax'

" indenation pour javascript/jquery/etc.
Bundle 'jiangmiao/simple-javascript-indenter'

" correction syntax pour plusieurs langages
Bundle 'scrooloose/syntastic'

" gestion des commentaires pour plusieurs languages
Bundle 'scrooloose/nerdcommenter'

" pour entrourer ou détrouer des mots/paragrpahe etc.
Bundle 'tpope/vim-surround'

" ...
Bundle 'tpope/vim-unimpaired'

" des barres en couleur et sympa status, buffer, tabs, etc.
Bundle 'bling/vim-airline'

" affiche les numéros ligen à partir la ligne courant
Bundle 'myusuf3/numbers.vim'

" recherche rapide dans des fichiers
Bundle 'kien/ctrlp.vim'

" Visualise les indentations par des couleurs
" Bundle 'nathanaelkane/vim-indent-guides'

" gestion mutlicursor
Bundle 'terryma/vim-multiple-cursors'

" visualise directment le code d'une couleur
Bundle 'skammer/vim-css-color'

" Permet de faire de rechercher la sélection visuelle
Bundle 'nelstrom/vim-visual-star-search'

" Affiche les tags du fichier courant
Bundle 'majutsushi/tagbar'

" Edit the file with an existing Vim if possible
Bundle 'svintus/vim-editexisting'

" Pour tricher un peu
Bundle 'touv/vim-arrow'

" From vim-scripts
" Complétion automatique en recherche /<tab>
" Bundle 'SearchComplete'

" From git
" Bundle 'git://git.wincent.com/command-t.git'

" From local
"Bundle 'file://'

filetype plugin indent on     " required!
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

set hidden          " Cache les buffers à la place des les décharger
set autochdir       " Set working directory to the current file
set nocompatible    " On n'assura pas la compatiblité avec VI et c'est tant mieux !
set noerrorbells    " ne fait pas un bip lors d'une erreur
set visualbell      " Fait clignoter l'écran lors d'une erreur de saisie, de commande etc...
set foldcolumn=2    " Ajoute une marge à gauche pour afficher les +/- des replis
set undolevels=2000 " Nombre maximum de changements qui peuvent être annulés
set spelllang=fr,en " Langue de correction par défaut
set title           " donne un titre aux fenetres xterm
set nowrap          " pas de retour à la ligne automatique
set sidescroll=5    " (lié à nowrap) nombre minimum de colonnes qui défilent horizontalement
set scrolloff=1     " commence le défilement vertical N lignes avant
set tags=tags;~/    " Look for the file in the current directory, then south until you reach home.

"set foldcolumn+=a   " reformatage automatique
"set textwidth=80    " largeur du text
"set wrapmargin=2   " Marge avant coupure
" }}}

" {{{ GUI
" -----------------------------------------------------------
if has('gui_running')
	set guioptions-=T               " supprime la barre d'outils
	" set transparency=5
end
" }}}

" {{{ Caractères invisibles
" -----------------------------------------------------------
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=eol:¬,tab:▸\ ,trail:·,precedes:«,extends:»,nbsp:%
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
set noexpandtab    " Tabulation génére des espaces
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

set completeopt+=menuone

set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d
" }}}

" {{{ Optimization
" -----------------------------------------------------------
set ttyfast       " Indicates a fast terminal connection
set nofsync       " improves performance -- let OS decide when to flush disk
" }}}

" {{{ Curseur
" -----------------------------------------------------------

if has("gui_running")
	set cursorline	
	set cursorcolumn
	hi CursorLine guibg=#FFEFFF
	hi CursorColumn guibg=#FFEFFF
endif
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
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
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

" {{{ Fenetres
" -----------------------------------------------------------
set wh=1           " minimal number of lines used for the current window
set wmh=0          " minimal number of lines used for any window
set noequalalways  " make all windows the same size when adding/removing windows
"set splitbelow     "a new window is put below the current one
" }}}

" {{{ Sauvegarde
" -----------------------------------------------------------
set backupdir=~/.backup,/tmp        " Répertoire de sauvegarde automatique
set backup                          " On active la sauvagarde
let savevers_dirs = &backupdir      " Même répertoire de sauvegarde que pour le backup classique
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


" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

"Toggle Spell check
nnoremap <F10>	  :set spell! spell?<CR>
imap     <F10>	  <C-o><F10>
vmap     <F10>	  <C-c><F10>

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

	" {{{ 11.4 Divers
	"    autocmd BufRead *\[[0-9]] set syntax=html filetype=html
	"    autocmd BufEnter * lcd %:p:h   " change to directory of current file automatically
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

" {{{ Pour supprimer les blancs en fin de ligne 
" -----------------------------------------------------------
"nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<CR>
noremap <leader>s :call StripWhitespace()<CR>
nnoremap <leader>S :%s/^\s\+//<cr>:let @/=''<CR>
" Strip trailing whitespace
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

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
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['php', 'javascript', 'xml', 'xslt'], 'passive_filetypes': ['html.js', 'html'] }
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" }}}

" {{{ Pour vim-css-color
" -----------------------------------------------------------
let g:cssColorVimDoNotMessMyUpdatetime = 1
" }}}

" {{{ Pour Air Line
" -----------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
" }}}
" vim:fdm=marker
