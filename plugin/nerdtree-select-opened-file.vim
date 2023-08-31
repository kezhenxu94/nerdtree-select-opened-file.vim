" ============================================================================
" File:        nerdtree-select-opened-file.vim
" Maintainer:  Ke Zhenxu <kezhenxu94 at apache dot org>
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
"
" SECTION: Script init stuff {{{1
"============================================================
scriptencoding utf-8

if exists('loaded_nerdtree_select_opened_file')
    finish
endif
if v:version < 703
    echoerr "NERDTree: this plugin requires vim >= 7.3. DOWNLOAD IT! You'll thank me later!"
    finish
endif
let loaded_nerdtree_select_opened_file = 1

function! s:isCurrentWindowNERDTree()
  return exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) == winnr()
endfun

function! s:isNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! g:NERDTreeSelectOpenedFile()
  if s:isCurrentWindowNERDTree()
    NERDTreeToggle
    return
  endif

  let s:cwd = getcwd()
  let s:filepath = expand('%:p:h') 
  let s:file_in_cwd = s:filepath[0:len(s:cwd)-1] ==# s:cwd

  if !s:isNTOpen()
    NERDTreeToggle
  endif

  if &modifiable && strlen(expand('%')) > 0 && !&diff && s:file_in_cwd
    NERDTreeFind
  else
    NERDTreeFocus
  endif
endfunction

command! -n=? -complete=dir -bar NERDTreeSelectOpenedFile :call g:NERDTreeSelectOpenedFile()
