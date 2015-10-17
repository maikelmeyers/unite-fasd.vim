if !exists('g:unite_fasd#fasd_cache')
  let g:unite_fasd#fasd_cache = '~/.fasd'
endif

if !exists('g:unite_fasd#fasd_path')
  let g:unite_fasd#base_cmd = ''
  finish
endif

let g:unite_fasd#base_cmd = '_FASD_DATA=' . g:unite_fasd#fasd_cache .
                          \ ' ' . g:unite_fasd#fasd_path

augroup unite_fasd_au
  au!
  au BufRead * call system(g:unite_fasd#base_cmd . ' -A ' . shellescape(@%))
augroup END
