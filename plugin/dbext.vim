packadd dbext

let g:dbext_default_always_prompt_for_variables=1

" Default to an in memory SQLite database
let g:dbext_default_type = 'SQLITE'
let g:dbext_default_dbname = ':memory:'
let g:dbext_default_user = ''
let g:dbext_default_passwd = ''
let g:dbext_default_profile = ''
let g:dbext_default_SQLITE_cmd_header = ".mode column\n"
let g:dbext_default_SQLITE_cmd_header .= ".headers ON\n"
let g:dbext_default_SQLITE_cmd_header .= "PRAGMA foreign_keys = ON;\n"

let g:dbext_default_parse_statements = 'select,update,delete,insert'
let g:dbext_default_parse_statements .= ',with,drop,create'

if $XDG_CONFIG_HOME ==# ''
  let g:dbext_default_history_file = $HOME.'/.vim/dbext_sql_history.txt'
else
  let g:dbext_default_history_file = $XDG_CONFIG_HOME.'/dbext_sql_history.txt'
endif

let g:dbext_default_profile_tabs = 'type=SQLITE:'
let g:dbext_default_profile_tabs .= "SQLITE_cmd_header=.mode tabs\n"
function! DBextPostResult(db_type, buf_nr)
  setlocal nolist
endfunction

let g:sql_type_default = 'sqlite'

let g:ftplugin_sql_omni_key       = '<S-Tab>' "See :help omni-sql-completion
let g:ftplugin_sql_omni_key_right = '<Tab>'
let g:ftplugin_sql_omni_key_left  = '<S-Tab>'

let s:saved_formatoptions=&formatoptions
runtime! ftplugin/sql.vim " changes formatoptions
let &formatoptions=s:saved_formatoptions

call opfunc#opfuncmap('l') " run in dbext
call opfunc#opfuncmap('L') " run in dbext with .mode list
