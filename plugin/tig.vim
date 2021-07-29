function! s:exist_nvr() abort
    let l:whichout = systemlist('which nvr')
    if l:whichout[0] == 'nvr not found'
        return 1
    else
        return 0
    endif
endfunction

let s:nvr = s:exist_nvr()
if s:nvr == 0
    let nvrcmd = "nvr --remote-wait"
    let $VISUAL = nvrcmd
    let $GIT_EDITOR = nvrcmd
    autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
endif

let s:start_status_view = 1
if exists('g:start_status_view')
  let s:start_status_view = g:start_status_view
endif

function! s:open_term(cmd) abort
  call execute(printf('vsplit term://%s', a:cmd))

  setlocal nonumber
  setlocal signcolumn=no
  setlocal noswapfile
  startinsert
endfunction

function! s:tig_status() abort
  call s:open_term('tig status')
endfunction

function! s:tig() abort
  call s:open_term('tig')
endfunction

" function! s:test_exist_nvr() abort
"     if s:exist_nvr()
"         echo('nvr not found')
"     else
"         echo('exist nvr')
"     endif
" endfunction

if s:start_status_view == 1
  command! -count -nargs=* Tig call s:tig_status()
else
  command! -count -nargs=* Tig call s:tig()
endif

" command! -count -nargs=* Nvr call s:test_exist_nvr()
