" ============================================================================
" File:        inverse.vim
" Description: A keyword(value) toggle plugin for VIM.
" Author:      Leif Högberg <leif@gomitech.com>
" License:     MIT
" Website:     https://github.com/leihog/vim-inverse
" Version:     0.1
" ============================================================================

if exists('g:loaded_inverse')
    finish
endif
let g:loaded_inverse = 1

function! s:allowOverwrite()
    if exists('g:inverse_allow_overwrite') && g:inverse_allow_overwrite
        return 1
    endif
endfunction

function! s:useInverseIsk()
    " default is to swap
    if !exists('g:inverse_swap_isk') || g:inverse_swap_isk
        return 1
    endif
endfunction

function! s:Setup()
    let s:inverse_targets = {'true': 'false', 'True': 'False', '1': '0', 'yes': 'no', 'on': 'off', 'enabled': 'disabled'}

    " Allow user to customize
    if exists('g:inverse_targets')
        for i in items(g:inverse_targets)
            if has_key(s:inverse_targets, i[0])
                if !s:allowOverwrite()
                    continue
                endif
            endif
            let s:inverse_targets[i[0]] = i[1]
        endfor
    endif

    " Add all the values as keys
    for i in items(s:inverse_targets)
        if !has_key(s:inverse_targets, i[1])
            let s:inverse_targets[i[1]] = i[0]
        endif
    endfor
endfunction

function! s:Inverse()

    let targets = s:inverse_targets
    let swapIsk = s:useInverseIsk()

    if swapIsk
        let isk = &iskeyword
        let &iskeyword = "@,48-57,_,192-255,#,-"
    endif

    let wordUnderCursor = expand("<cword>")
    if has_key(targets, wordUnderCursor)
        let l:default_register = @"
        normal! diw
        let @" = targets[wordUnderCursor]
        normal! P
        let @" = l:default_register
    endif

    if swapIsk
        let &iskeyword = isk
    endif

endfunction

call s:Setup()

command! Inverse call s:Inverse()
command! InverseSetup call s:Setup()
