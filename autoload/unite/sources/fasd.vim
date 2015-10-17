function! unite#sources#fasd#define()
  return s:source_fasd
endfun

let s:source_fasd = {
  \   'name' : 'fasd',
  \   'description' : 'Get candidates from fasd',
  \ }

function! s:source_fasd.gather_candidates(args, context)
  if !exists('g:unite_fasd#fasd_path')
    return [{
      \   'word': 'g:unite_fasd#fasd_path not set.',
      \   'kind': 'buffer',
      \   'action__buffer_nr': bufnr('%')
      \ }]
  endif

  let cmd = g:unite_fasd#base_cmd . ' -fRl'
  if len(a:args) && a:args[0] == 'mru'
    let cmd = cmd . 't'
  endif

  return map(split(system(cmd), "\n"), "{
    \   'word': v:val,
    \   'kind': 'file',
    \   'action__path': v:val
    \ }")
endfun
