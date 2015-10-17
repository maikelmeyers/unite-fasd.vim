if !exists('g:unite_fasd#fasd_cache')
  let g:unite_fasd#fasd_cache = '~/.fasd'
endif

if !exists('g:unite_fasd#fasd_path')
  let g:unite_fasd#base_cmd = ''
  finish
endif

let g:unite_fasd#base_cmd = '_FASD_DATA=' . g:unite_fasd#fasd_cache .
                          \ ' ' . g:unite_fasd#fasd_path

if !exists('g:unite_fasd#read_only')
  let g:unite_fasd#read_only = 1
endif

function s:fasd_add(file)
  if g:unite_fasd#read_only == 0
    call system(g:unite_fasd#base_cmd . ' -A ' . shellescape(a:file))
  endif
endfun

augroup unite_fasd_au
  au!
  au BufRead * call s:fasd_add(@%)
augroup END

let g:loaded_unite_fasd = 1
