:nnoremap <leader>gy :Goyo
:nnoremap <leader>ll :Limelight!!

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


:nnoremap <leader>ltc :LanguageToolCheck

function! s:goyo_enter()
  :set wrap
  :set linebreak
endfunction



function! s:goyo_leave()
:set nowrap
endfunction
