" ~/.vimrc — Synth Wave '84 Luis Reyes' Remix
" Palette sampled from ~/code/dotfiles/colorpreset.itermcolors
" so Vim matches the iTerm theme exactly (darker, less neon than original).

set nocompatible
syntax on
filetype plugin indent on

if has('termguicolors')
  set termguicolors
endif
set background=dark

" Sensible defaults
set number
set relativenumber
set cursorline
set ruler
set showcmd
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set wrap
set linebreak
set scrolloff=5
set sidescrolloff=8
set wildmenu
set wildmode=longest:full,full
set laststatus=2
set encoding=utf-8
set backspace=indent,eol,start
set mouse=a
set hidden
set ttyfast
set lazyredraw
set updatetime=300
set splitright
set splitbelow
if has('persistent_undo')
  set undofile
endif

" ----- Luis Reyes' Remix palette (sampled from .itermcolors) -----
"   bg          #2a2139   iTerm background
"   bg_alt      #241b2f   slightly darker (gutter / inactive panes)
"   bg_lighter  #34294f   cursorline / selection bg
"   fg          #f0eff1   foreground
"   comment     #6272a4   muted lavender-blue
"   blue        #6d77b3   ANSI 4 (muted) — zsh user@host
"   purple      #c792ea   ANSI 5 — zsh path
"   pink        #f772e0   ANSI 6 (hot pink, cursor)
"   yellow      #fede5d   ANSI 3 — zsh prompt / commands
"   orange      #f97e72   ANSI 1
"   coral       #f88414   ANSI 9
"   green       #72f1b8   ANSI 2
"   cyan        #36f9f6   ANSI 12 (the neon cyan, used sparingly)
"   magenta     #f92aad   ANSI 14
"   lavender    #e1acff   ANSI 13
"   red         #fe4450   error

hi clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'synthwave_remix'

" Editor chrome
hi Normal        guifg=#f0eff1 guibg=#2a2139
hi NormalNC      guifg=#f0eff1 guibg=#2a2139
hi LineNr        guifg=#495495 guibg=#2a2139
hi CursorLineNr  guifg=#fede5d guibg=#34294f gui=bold
hi CursorLine    guibg=#34294f gui=NONE cterm=NONE
hi CursorColumn  guibg=#34294f
hi SignColumn    guibg=#2a2139
hi VertSplit     guifg=#495495 guibg=#2a2139
hi ColorColumn   guibg=#241b2f
hi MatchParen    guifg=#fede5d guibg=#495495 gui=bold
hi Visual        guibg=#34294f
hi Search        guifg=#2a2139 guibg=#fede5d
hi IncSearch     guifg=#2a2139 guibg=#f772e0 gui=bold
hi NonText       guifg=#495495
hi SpecialKey    guifg=#495495
hi Folded        guifg=#6272a4 guibg=#241b2f
hi FoldColumn    guifg=#6272a4 guibg=#2a2139
hi Pmenu         guifg=#f0eff1 guibg=#241b2f
hi PmenuSel      guifg=#2a2139 guibg=#f772e0 gui=bold
hi PmenuSbar     guibg=#241b2f
hi PmenuThumb    guibg=#f772e0
hi WildMenu      guifg=#2a2139 guibg=#fede5d gui=bold
hi TabLine       guifg=#6272a4 guibg=#241b2f gui=NONE
hi TabLineSel    guifg=#fede5d guibg=#2a2139 gui=bold
hi TabLineFill   guibg=#2a2139
hi Title         guifg=#f772e0 gui=bold
hi Directory     guifg=#c792ea gui=bold      " matches zsh path color
hi Question      guifg=#fede5d
hi ModeMsg       guifg=#fede5d gui=bold
hi MoreMsg       guifg=#72f1b8
hi WarningMsg    guifg=#f97e72 gui=bold
hi ErrorMsg      guifg=#fe4450 gui=bold
hi Error         guifg=#fe4450 gui=bold
hi Conceal       guifg=#6272a4

" Statusline — mirrors zsh prompt: blue user@host, purple path, yellow %#
hi StatusLine    guifg=#6d77b3 guibg=#241b2f gui=bold
hi StatusLineNC  guifg=#6272a4 guibg=#241b2f gui=NONE
hi User1         guifg=#6d77b3 guibg=#241b2f gui=bold
hi User2         guifg=#c792ea guibg=#241b2f gui=bold
hi User3         guifg=#fede5d guibg=#241b2f gui=bold

set statusline=
set statusline+=%1*\ %n\ %*
set statusline+=%2*\ %f\ %*
set statusline+=%3*%m%r%h%w\ %*
set statusline+=%=
set statusline+=%1*\ %y\ %*
set statusline+=%2*\ %{&fileencoding?&fileencoding:&encoding}\ %*
set statusline+=%3*\ %p%%\ %l:%c\ %*

" Syntax highlighting
hi Comment       guifg=#6272a4 gui=italic
hi Constant      guifg=#f97e72
hi String        guifg=#f772e0
hi Character     guifg=#f772e0
hi Number        guifg=#f97e72
hi Boolean       guifg=#f97e72 gui=bold
hi Float         guifg=#f97e72

hi Identifier    guifg=#6d77b3 gui=NONE
hi Function      guifg=#e1acff gui=bold

hi Statement     guifg=#fede5d gui=bold
hi Conditional   guifg=#fede5d gui=bold
hi Repeat        guifg=#fede5d gui=bold
hi Label         guifg=#fede5d
hi Operator      guifg=#f772e0
hi Keyword       guifg=#fede5d gui=bold
hi Exception     guifg=#fe4450 gui=bold

hi PreProc       guifg=#36f9f6
hi Include       guifg=#36f9f6 gui=bold
hi Define        guifg=#36f9f6
hi Macro         guifg=#36f9f6
hi PreCondit     guifg=#36f9f6

hi Type          guifg=#c792ea gui=bold
hi StorageClass  guifg=#fede5d gui=italic
hi Structure     guifg=#c792ea gui=bold
hi Typedef       guifg=#c792ea

hi Special       guifg=#f772e0 gui=bold
hi SpecialChar   guifg=#f772e0
hi Tag           guifg=#f92aad
hi Delimiter     guifg=#f0eff1
hi SpecialComment guifg=#6272a4 gui=bold,italic
hi Debug         guifg=#fe4450

hi Underlined    guifg=#36f9f6 gui=underline
hi Ignore        guifg=#495495
hi Todo          guifg=#2a2139 guibg=#fede5d gui=bold

" Diff
hi DiffAdd       guifg=#72f1b8 guibg=#1f3a2f
hi DiffChange    guifg=#fede5d guibg=#3a3520
hi DiffDelete    guifg=#fe4450 guibg=#3a1f24
hi DiffText      guifg=#f772e0 guibg=#3a3520 gui=bold

" Spell
hi SpellBad      guisp=#fe4450 gui=undercurl
hi SpellCap      guisp=#fede5d gui=undercurl
hi SpellRare     guisp=#f772e0 gui=undercurl
hi SpellLocal    guisp=#36f9f6 gui=undercurl

" Filetype-specific accents
hi link markdownH1       Title
hi link markdownH2       Title
hi link markdownCode     String
hi link markdownLinkText Underlined
hi link htmlTag          Tag
hi link htmlEndTag       Tag
hi link pythonBuiltin    Type
hi link pythonDecorator  PreProc

" Netrw — match zsh ls colors
hi netrwDir       guifg=#c792ea gui=bold
hi netrwExe       guifg=#fede5d gui=bold
hi netrwSymLink   guifg=#36f9f6
hi netrwLink      guifg=#36f9f6

" Cursor
hi Cursor   guifg=#2a2139 guibg=#f772e0
hi lCursor  guifg=#2a2139 guibg=#f772e0

" Keymaps
let mapleader = ","
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :Explore<CR>
