" Name:        a11y-light
" Author:      original author Reuben L. Lillie <@reubenlillie>
" DerivedFrom: https://www.github.com/vim/colorschemes 

" Table 1. Theme colors with Xterm (X11) and ANSI approximations
" ------------------------------------------------------------------------
"  №  ANSI         HEX     Name              X11 №  X11 HEX   X11 Name
" ------------------------------------------------------------------------
"  0  Black        #545454 Emperor           240    #585858   Grey35
"  3  Brown        #aa5d00 Chelsea Gem       130    #af5f00   DarkOrange3
"  6  DarkCyan     #007299 Allports           31    #0087af   DeepSkyBlue3
"  8  DarkGray     #696969 Dove Gray         242    #6c6c6c   Grey42
"  9  Red          #d91e18 Thunderbird       160    #d70000   Red3
" 10  Green        #008000 Japanese Laurel    28    #008700   Green4
" 15  White        #fefefe White              15    #ffffff   White
" ------------------------------------------------------------------------

" ========================
" §1. Prepare color scheme
" ========================

set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="a11y-dark"
let s:t_Co = exists('&t_Co') && !has('gui_running') ? (&t_Co ?? 0) : -1

" =====================================================================
" §2. Override default syntax highlighting links for specific languages
" =====================================================================

" Link the following highlight groups to the basic groups defined in §3.

" ------------------------------
" §2.1. HTML, Markdown, and YAML
" ------------------------------

" Black
hi! link htmlTag Normal
hi! link markdownYamlHead Normal
hi! link yamlDocumentStart Normal
hi! link yamlFlowIndicator Normal
hi! link yamlKeyValueDelimiter Normal
" Brown
hi! link yamlBlockMappingKey Constant
hi! link yamlFlowString Constant
" DarkCyan
hi! link markdownCodeBlock Statement
hi! link markdownCodeDelimiter Statement

" ---------
" §2.2. CSS
" ---------

" DarkGray
hi! link cssBraces Comment

" ----------------
" §2.3. JavaScript
" ----------------

" Brown
hi! link javaScriptConditional Constant
hi! link javaScriptLabel Constant
hi! link javaScriptNumber Constant
hi! link javaScriptSpecial Constant
hi! link javaScriptStatement Constant
" Red
hi! link javaScriptNull Identifier
" DarkCyan
hi! link javaScriptConstant Statement
" DarkGray
hi! link javaScriptBraces Comment
hi! link javaScriptEmbed Comment
hi! link javaScriptParens Comment
" Green
hi! link javaScriptOperator Special
hi! link javaScriptReserved Special
hi! link javaScriptStringS Special
hi! link javaScriptStringT Special

" ------------------------------
" §2.4 Link Vim highlight groups
" ------------------------------

" Brown
hi! link NonText Constant
hi! link Type Constant
" DarkGray
hi! link LineNr Comment
" Red
hi! link CursorLineNr Identifier
hi! link PreProc Identifier
" Green
hi! link EndOfBuffer Special
" Other highlight groups
hi! link ColorColumn Visual
hi! link CurSearch Search
hi! link Folded Ignore
hi! link MatchParen Visual
hi! link Pmenu Ignore
hi! link PmenuSel Search
hi! link SpellBad ErrorMsg
hi! link TabLine Ignore
hi! link WildMenu Search
hi! link vimHiKeyError ErrorMsg

" ========================================================
" §3. Set basic color scheme for different editions of Vim
" ========================================================

" --------------------------
" §3.1 gVim highlight groups
" --------------------------

" Define an array of hexadecimal codes to override the 16 basic ANSI colors.
if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#545454', '#007299', '#008000', '#aa5d00', '#d91e18', '#dcc6e0', '#aa5d00', '#696969', '#696969', '#007299', '#008000', '#007299', '#d91e18', '#dcc6e0', '#aa5d00', '#fefefe']
endif

" Black
hi Normal guifg=#545454 guibg=#fefefe gui=NONE
" Brown
hi Constant guifg=#aa5d00 guibg=#fefefe gui=NONE
" DarkCyan
hi Statement guifg=#007299 guibg=#fefefe gui=NONE
" DarkGray
hi Comment guifg=#696969 guibg=#fefefe gui=NONE
" Red
hi Identifier guifg=#d91e18 guibg=#fefefe gui=NONE
" Green
hi Special guifg=#008000 guibg=#fefefe gui=NONE
" Other highlight groups
hi ErrorMsg guifg=#fefefe guibg=#d91e18 gui=bold
hi Ignore guifg=#fefefe guibg=#696969 gui=NONE
hi Search guifg=#fefefe guibg=#007299 gui=bold
hi Title guifg=NONE guibg=NONE gui=bold
hi Todo guifg=#fefefe guibg=#008000 gui=bold
hi Underlined guifg=NONE guibg=NONE gui=underline
hi Visual guifg=NONE guibg=NONE gui=reverse

" -------------------------------------------------------
" §3.2. Vim highlight groups for 256-color Xterm consoles
" -------------------------------------------------------

" Xterm colors are available to most modern terminal emulators.
if s:t_Co >= 256
  " Black
  hi Normal ctermbg=15 ctermfg=240 cterm=NONE
  " Brown
  hi Constant ctermfg=130 ctermbg=15 cterm=NONE
  " DarkCyan
  hi Statement ctermfg=31 ctermbg=15 cterm=NONE
  " DarkGray
  hi Comment ctermfg=242 ctermbg=15 cterm=NONE
  " Red
  hi Identifier ctermfg=160 ctermbg=15 cterm=NONE
  " Green
  hi Special ctermfg=28 ctermbg=15 cterm=NONE
  " Other highlight groups
  hi ErrorMsg ctermfg=15 ctermbg=160 cterm=bold
  hi Ignore ctermfg=15 ctermbg=242 cterm=NONE
  hi Search ctermfg=15 ctermbg=31 cterm=bold
  hi Title ctermfg=NONE ctermbg=NONE cterm=bold
  hi Todo ctermfg=15 ctermbg=28 cterm=bold
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
  unlet s:t_Co
  finish
endif

" -----------------------------------------------------
" §3.3. Vim highlight groups for 16-color ANSI consoles
" -----------------------------------------------------

" ANSI colors are available to most legacy terminal emulators.
if s:t_Co >= 16
  " Black
  hi Normal ctermfg=Black ctermbg=White  cterm=NONE
  " Brown
  hi Constant ctermfg=Brown ctermbg=White cterm=NONE
  hi Type ctermfg=Brown ctermbg=White cterm=NONE
  " DarkCyan
  hi Statement ctermfg=DarkCyan ctermbg=White cterm=NONE
  " DarkGray
  hi Comment ctermfg=DarkGray ctermbg=White cterm=NONE
  " Red
  hi Identifier ctermfg=Red ctermbg=White cterm=NONE
  " Green
  hi Special ctermfg=Green ctermbg=White cterm=NONE
  " Other highlight groups
  hi ErrorMsg ctermfg=White ctermbg=Red cterm=bold
  hi Ignore ctermfg=White ctermbg=DarkGray cterm=NONE
  hi Search ctermfg=White ctermbg=DarkCyan cterm=bold
  hi Title ctermfg=NONE ctermbg=NONE cterm=bold
  hi Todo ctermfg=White ctermbg=Green cterm=bold
  hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
  hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
  unlet s:t_Co
  finish
endif
