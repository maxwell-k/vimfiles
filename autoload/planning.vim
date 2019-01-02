function! planning#commit() abort "{{{
    let l:wd_save = getcwd()
    execute 'lcd '.fnameescape(expand('%:p:h'))
    let l:result = system('git rev-parse --show-cdup')
    if strlen(l:result) > 1
        execute 'lcd '.l:result
    endif
    if executable('git')
        let l:choice =  confirm('Record changes to git repository?',
            \ "&Yes\n&No",'1')
        if l:choice == 1
            "Add the file and display any message
            let l:cmd = 'git add ' . shellescape(expand('%:p'))
            let l:result = system(l:cmd)
            if !empty(l:result)
                echom l:result
            endif
            "This step is required because commit alone won't work with
            "untracked files

            "Commit the file and display the message
            let l:cmd = 'git commit -m "Automatic commit (vim)" '
            let l:cmd .= shellescape(expand('%:p'))
            for l:i in split(system(l:cmd), "\n")
                echom l:i
            endfor
        endif
    else
        echom "Can't find git binary"
    endif
    execute 'lcd '.l:wd_save
endfunction "}}}
