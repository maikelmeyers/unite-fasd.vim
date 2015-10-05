if !exists('g:unite_fasd#fasd_cache')
  let g:unite_fasd#fasd_cache = '~/.fasd'
endif

if !exists('g:unite_fasd#viminfo')
  if has('nvim')
    let g:unite_fasd#viminfo = '~/.nviminfo'
  else
    let g:unite_fasd#viminfo = '~/.viminfo'
  endif
endif

if !exists('g:unite_fasd#viminfo_cache')
  let g:unite_fasd#viminfo_cache = tempname()
endif

call system('[ -f ' . g:unite_fasd#viminfo_cache . ' ] || cp ' .
  \ g:unite_fasd#viminfo . ' ' . g:unite_fasd#viminfo_cache)

augroup unite_fasd_au
  au!
  au VimLeavePre * exe 'wviminfo ' . g:unite_fasd#viminfo_cache
augroup END
