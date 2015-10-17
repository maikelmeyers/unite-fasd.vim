# unite-fasd.vim

This plugin defines 'fasd' source for [unite.vim](https://github.com/Shougo/unite.vim). It invokes [`fasd` script](https://github.com/clvv/fasd) for gathering candidates.

## Configuration example

```vim
" Path to fasd script (must be set)
let g:unite_fasd#fasd_path = '~/.zsh/fasd/fasd'

" Path to fasd cache -- defaults to '~/.fasd'
let g:unite_fasd#fasd_cache = '~/.cache/fasd'

" Allow `fasd -A` on `BufRead`
let g:unite_fasd#read_only = 0
```
If you do not keep a separate `fasd_cache` for vim, you should probably do:
```vim
au VimEnter * let g:unite_fasd#read_only = 0
" Note: BufRead is executed before VimEnter
```
Otherwise, each file opened directly from the shell will get `fasd -A`ed twice.

## Usage

`:Unite fasd` for listing files indexed by `fasd`. Sorting would be based on default weights assigned by `fasd`.

`:Unite fasd:mru` Same as above, except that it will be sorted in most-recently-used-first order.
