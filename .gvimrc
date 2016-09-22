set gfn=Inconsolata\-dz\ for\ Powerline\ 10
set guioptions -=T
set guioptions -=m
set guioptions -=r " never allow right hand scrollbar
set guioptions -=L " never allow left hand scrollbar


nnoremap <C-M> :call ModifyFontSize(1)<CR>
nnoremap <C-N> :call ModifyFontSize(-1)<CR>

let g:myFontName="Inconsolata\\-dz\\ for\\ Powerline"
let g:currentFontSize=10
function! ModifyFontSize(amt)
    let g:currentFontSize = g:currentFontSize + a:amt
    exe "set gfn=" . g:myFontName . "\\" g:currentFontSize
    redraw!
    silent :e
endfunction

