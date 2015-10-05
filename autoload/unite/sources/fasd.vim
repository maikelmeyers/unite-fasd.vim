let s:fasd_base_cmd = '_FASD_DATA=' . g:unite_fasd#fasd_cache . ' ' .
                    \ '_FASD_VIMINFO=' . g:unite_fasd#viminfo_cache . ' ' .
                    \ get(g:, 'unite_fasd#fasd_path', '') . ' -fRl -B viminfo'

function! unite#sources#fasd#define()
  if !exists('g:unite_fasd#fasd_path')
    echohl WarningMsg
    echom 'g:unite_fasd#fasd_path not set.'
    echohl Normal
  endif
  return s:source_fasd
endfun

let s:source_fasd = {
  \   'name' : 'fasd',
  \   'description' : 'Get candidates from fasd',
  \ }

function! s:source_fasd.gather_candidates(args, context)
  if len(a:args) && a:args[0] == 'mru'
    return s:mru_candidates(a:args[1:])
  else
    return s:candidates_from_sh(s:fasd_base_cmd)
  endif
endfun

function! s:candidates_from_sh(sh_cmd)
  if !exists('g:unite_fasd#fasd_path')
    return []
  endif
  return map(split(system(a:sh_cmd), "\n"), "{
    \   'word': v:val,
    \   'kind': 'file',
    \   'action__path': v:val
    \ }")
endfun

function! s:mru_candidates(args)
  if exists('s:fasd_mru') && len(s:fasd_mru) && !(len(a:args) && a:args[0] == 'reload')
    return s:fasd_mru
  endif
  exe 'wviminfo ' . g:unite_fasd#viminfo_cache
  return s:candidates_from_sh(s:fasd_base_cmd . ' -t')
endfun
