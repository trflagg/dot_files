" load vim configs
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" use this for python3 executatble
let g:python3_host_prog = '/usr/local/bin/python3'

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/shortcuts.vim
source ~/.config/nvim/writing.vim
