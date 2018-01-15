" Basic mode of SpaceVim, generated by SpaceVim automatically.
let g:spacevim_enable_guicolors = 0
let g:spacevim_statusline_separator = 'nil'
let g:spacevim_statusline_inactive_separator = 'bar'
let g:spacevim_buffer_index_type = 4
let g:spacevim_enable_tabline_filetype_icon = 0
let g:spacevim_enable_statusline_display_mode = 0

" layers
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#colorscheme')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('lang#default')
call SpaceVim#layers#load('lang#chinese')
call SpaceVim#layers#load('autocomplete')
call SpaceVim#layers#load('checkers')
call SpaceVim#layers#load('git')

" colorscheme
let g:spacevim_colorscheme = 'onedark'
let g:spacevim_colorscheme_bg = 'dark'

" default indent
let g:spacevim_defatult_indent = 4
let g:spacevim_max_column = 80

" font
let g:spacevim_guifont = 'Souece\ Code\ Pro\ for\ Powerline\ 15'

" use ale
let g:spacevim_enable_neomake = 0
let g:spacevim_enable_ale = 1

