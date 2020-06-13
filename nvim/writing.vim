:nnoremap <leader>gy :Goyo
:nnoremap <leader>ll :Limelight!!

autocmd! User GoyoEnter Limelight 
autocmd! User GoyoEnter Limelight!

autocmd! User GoyoLeave SoftPencil 
autocmd! User GoyoLeave PencilOff 

:nnoremap <leader>ltc :LanguageToolCheck

:autocmd! numbertoggle

function! s:goyo_enter()
  :set wrap
  :set linebreak
endfunction

nnoremap j gj
nnoremap k gk

function! Oneline()
    let g:limelight_bop = '^'
    let g:limelight_eop = '$'
    Limelight 1
endfunction

function! Multiline()
    let g:limelight_bop = '^\s*$\n\zs'
    let g:limelight_eop = '^\s*$'
    Limelight 0.5
endfunction

nnoremap <leader>o :call Oneline()
nnoremap <leader>m :call Multiline()


function! s:goyo_leave()
:set nowrap
endfunction
