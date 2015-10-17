function! unite#sources#fasd#define()
  return s:source_fasd
endfun

let s:source_fasd = {
  \   'name' : 'fasd',
  \   'description' : 'Get candidates from fasd',
  \ }

function! s:source_fasd.gather_candidates(args, context)
  if len(a:args) && a:args[0] == 'mru'
    let cmd = g:unite_fasd#base_cmd . ' -fRlt'
  else
    let cmd = g:unite_fasd#base_cmd . ' -fRl'
  endif
  return s:candidates_from_sh(cmd)
endfun

function! s:candidates_from_sh(sh_cmd)
  if !exists('g:unite_fasd#fasd_path')
    return [{
      \   'word': 'g:unite_fasd#fasd_path not set.',
      \   'kind': 'buffer',
      \   'action__buffer_nr': bufnr('%')
      \ }]
  endif
  return map(split(system(a:sh_cmd), "\n"), "{
    \   'word': v:val,
    \   'kind': 'file',
    \   'action__path': v:val
    \ }")
endfun
