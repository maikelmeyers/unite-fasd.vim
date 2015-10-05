# unite-fasd.vim

This plugin defines 'fasd' source for [unite.vim](https://github.com/Shougo/unite.vim). It invokes [`fasd` script](https://github.com/clvv/fasd) for gathering candidates.

## Configuration example

```vim
" Path to fasd script (must be set)
let g:unite_fasd#fasd_path = '~/.zsh/fasd/fasd'

" Path to fasd cache -- defaults to '~/.fasd'
let g:unite_fasd#fasd_cache = '~/.cache/fasd'

" Path to a temporary file -- defaults to `tempname()`
let g:unite_fasd#viminfo_cache = '/tmp/ufasd_viminfo_cache'
```

## Usage

`:Unite fasd` for listing files indexed by `fasd` with additional `viminfo` backend. Sorting would be based on default weights assigned by `fasd`.

`:Unite fasd:mru` Same as above, except that it will be sorted in most-recently-used-first order.
