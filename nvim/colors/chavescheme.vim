hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "chavescheme"

set background=light

hi Normal ctermfg=236 ctermbg=254 guifg=#697383 guibg=#f1f1f1
hi Cursor ctermfg=none ctermbg=59 cterm=none guifg=none guibg=#555f6f gui=none
hi CursorIM ctermfg=none ctermbg=59 guifg=none guibg=#555f6f
hi CursorLine ctermfg=none ctermbg=188 cterm=bold guifg=none guibg=#dfddd7 gui=bold
hi CursorColumn ctermfg=none ctermbg=188 cterm=none guifg=none guibg=#dfddd7 gui=none
hi Visual ctermfg=none ctermbg=185 cterm=none guifg=none guibg=#dfddd7 gui=none
hi VisualNOS cterm=underline guifg=fg gui=underline
hi Folded ctermfg=243 ctermbg=188 cterm=none guifg=#697383 guibg=#dfddd7 gui=none
hi FoldColumn ctermfg=243 ctermbg=254 cterm=none guifg=#697383 guibg=#e7e5e2 gui=none
hi Title ctermfg=132 ctermbg=none cterm=bold guifg=#a05b89 guibg=none gui=bold
hi StatusLine ctermfg=243 ctermbg=251 cterm=none guifg=#697383 guibg=#d3d1cc gui=none
hi StatusLineNC ctermfg=247 ctermbg=188 cterm=none guifg=#929cad guibg=#dfddd7 gui=none
hi VertSplit ctermfg=188 ctermbg=188 cterm=none guifg=#dfddd7 guibg=#dfddd7 gui=none
hi LineNr ctermfg=145 ctermbg=188 cterm=none guifg=#bdbbb6 guibg=#dfddd7 gui=none
hi CursorLineNr ctermfg=59 ctermbg=251 cterm=bold guifg=#555f6f guibg=#d3d1cc gui=bold
hi SpecialKey ctermfg=188 ctermbg=66 cterm=bold guifg=#cbd7dc guibg=#5e99b1 gui=bold
hi NonText ctermfg=247 ctermbg=254 cterm=none guifg=#929cad guibg=#e7e5e2 gui=none
hi MatchParen ctermfg=132 ctermbg=none cterm=bold guifg=#aa586e guibg=none gui=bold
hi Comment ctermfg=245 cterm=none guifg=#929cad gui=none
hi Constant ctermfg=29 ctermbg=none cterm=none guifg=#608f8e guibg=#cfd9d9 gui=none
hi Number ctermfg=237 ctermbg=none cterm=none guifg=#5e99b1 guibg=#cbd7dc gui=none
hi Identifier ctermfg=59 cterm=none guifg=#555f6f gui=bold
hi Function ctermfg=237 cterm=none guifg=#555f6f gui=bold
hi Statement ctermfg=25 cterm=none guifg=#56759a gui=bold
hi Operator ctermfg=132 cterm=none guifg=#a05b89 gui=none
hi Include ctermfg=25 cterm=none guifg=#7c6a93 gui=none
hi PreProc ctermfg=25 cterm=none guifg=#9784ae gui=none
hi Type ctermfg=236 cterm=none guifg=#a05b89 gui=none
hi StorageClass ctermfg=24 cterm=bold guifg=#56759a gui=bold
hi Structure ctermfg=132 cterm=none guifg=#a05b89 gui=none
hi Typedef ctermfg=24 cterm=bold guifg=#56759a gui=bold
hi Special ctermfg=67 ctermbg=none cterm=bold guifg=#7593bb guibg=none gui=bold
hi Underlined cterm=underline guifg=fg gui=underline
hi Ignore guifg=bg
hi Error ctermfg=132 ctermbg=181 cterm=bold guifg=#aa586e guibg=#edb8c4 gui=bold
hi Todo ctermfg=243 ctermbg=254 cterm=bold guifg=#697383 guibg=#e7e5e2 gui=bold
hi IncSearch ctermfg=254 ctermbg=66 cterm=bold guifg=#e7e5e2 guibg=#5e99b1 gui=bold
hi Search ctermfg=none ctermbg=186 cterm=none guifg=#e7e5e2 guibg=#447487 gui=none
hi Pmenu ctermfg=243 ctermbg=251 cterm=none guifg=#697383 guibg=#d3d1cc gui=none
hi PmenuSel ctermfg=59 ctermbg=145 cterm=bold guifg=#555f6f guibg=#bdbbb6 gui=bold
hi PmenuSbar ctermbg=188 cterm=none guibg=#dfddd7 gui=none
hi PmenuThumb ctermbg=247 cterm=none guibg=#929cad gui=none
hi TabLine ctermfg=243 ctermbg=254 cterm=none guifg=#697383 guibg=#e7e5e2 gui=none
hi TabLineSel ctermfg=254 ctermbg=132 cterm=bold guifg=#e7e5e2 guibg=#a05b89 gui=bold
hi TabLineFill ctermfg=243 ctermbg=254 cterm=none guifg=#697383 guibg=#e7e5e2 gui=none
hi SpellBad cterm=undercurl gui=undercurl
hi SpellCap cterm=undercurl gui=undercurl
hi SpellRare cterm=undercurl gui=undercurl
hi SpellLocal cterm=undercurl gui=undercurl
hi DiffAdd ctermfg=66 ctermbg=188 cterm=bold guifg=#5e99b1 guibg=#cbd7dc gui=bold
hi DiffChange ctermfg=175 ctermbg=188 cterm=none guifg=#b0789b guibg=#dcd1d8 gui=none
hi DiffDelete ctermfg=175 ctermbg=188 cterm=none guifg=#b0789b guibg=#dcd1d8 gui=none
hi DiffText ctermfg=132 ctermbg=188 cterm=bold guifg=#a05b89 guibg=#dcd1d8 gui=bold
hi diffAdded ctermfg=66 ctermbg=188 cterm=none guifg=#5e99b1 guibg=#cbd7dc gui=none
hi diffRemoved ctermfg=175 ctermbg=188 cterm=none guifg=#b0789b guibg=#dcd1d8 gui=none
hi Directory ctermfg=66 cterm=none guifg=#608f8e gui=none
hi ErrorMsg ctermfg=132 ctermbg=none cterm=none guifg=#aa586e guibg=none gui=none
hi SignColumn ctermfg=243 ctermbg=188 cterm=none guifg=#697383 guibg=#dfddd7 gui=none
hi MoreMsg ctermfg=24 cterm=none guifg=#56759a gui=none
hi ModeMsg cterm=bold gui=bold
hi Question cterm=none guifg=fg gui=none
hi WarningMsg ctermfg=132 cterm=none guifg=#aa586e gui=none
hi WildMenu ctermfg=59 ctermbg=247 cterm=bold guifg=#555f6f guibg=#929cad gui=bold
hi ColorColumn ctermfg=none ctermbg=181 cterm=none guifg=none guibg=#edb8c4 gui=none

hi link String Constant
