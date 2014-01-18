if exists('g:loaded_tagfinder') || &cp
  finish
endif

let g:loaded_tagfinder = '0.1.0' " version number
let s:keepcpo          = &cpo
set cpo&vim

if !exists('g:tagfinder_commands')
  let g:tagfinder_commands = {}
endif

command! -nargs=+ DefineLocalTagFinder call s:DefineTagFinder(<f-args>)
function s:DefineLocalTagFinder(name, ...)
  let kinds = join(a:000, ',')

  if !exists('b:tagfinder_commands')
    let b:tagfinder_commands = {}
  endif

  let b:tagfinder_commands[a:name] = split(kinds, ',')

  exe 'command! -buffer -nargs=1 -complete=customlist,tagfinder#CompleteTagFinder '.a:name.' call tagfinder#JumpToTag(<f-args>, "'.kinds.'")'
endfunction

command! -nargs=+ DefineTagFinder call s:DefineTagFinder(<f-args>)
function s:DefineTagFinder(name, ...)
  let kinds = join(a:000, ',')
  let g:tagfinder_commands[a:name] = split(kinds, ',')

  exe 'command! -nargs=1 -complete=customlist,tagfinder#CompleteTagFinder '.a:name.' call tagfinder#JumpToTag(<f-args>, "'.kinds.'")'
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
