let s:start_status_view = 1
if exists('g:start_status_view')
  let s:start_status_view = g:start_status_view
endif

function! s:open_term(cmd) abort
  call execute(printf('vsplit term://%s', a:cmd))

  setlocal nonumber
  setlocal signcolumn=no
  setlocal filetype=tig
  setlocal noswapfile
  startinsert
endfunction

function! s:tig_status() abort
  call s:open_term('tig status')
endfunction

function! s:tig() abort
  call s:open_term('tig')
endfunction

if s:start_status_view == 1
  command! -count -nargs=* Tig call s:tig_status()
else
  command! -count -nargs=* Tig call s:tig()
endif

