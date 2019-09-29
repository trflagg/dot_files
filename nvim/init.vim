" load vim configs
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" use this for python3 executatble
let g:python3_host_prog = '/usr/local/bin/python3'

" all of my plugins
source ~/.config/nvim/plugins.vim
