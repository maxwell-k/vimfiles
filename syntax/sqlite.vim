syn case match "encourage consistency in capitalisation

" 4 sqlite types from https://www.sqlite.org/datatype3.html
syn keyword sqlType INTEGER
syn keyword sqlType REAL
syn keyword sqlType TEXT
syn keyword sqlType BLOB
hi def link sqlType Type

" 124 sqlite keywords from https://www.sqlite.org/lang_keywords.html
syn keyword sqlKeyword ABORT
syn keyword sqlKeyword ACTION
syn keyword sqlKeyword ADD
syn keyword sqlKeyword AFTER
syn keyword sqlKeyword ALL
syn keyword sqlKeyword ALTER
syn keyword sqlKeyword ANALYZE
syn keyword sqlKeyword AND
syn keyword sqlKeyword AS
syn keyword sqlKeyword ASC
syn keyword sqlKeyword ATTACH
syn keyword sqlKeyword AUTOINCREMENT
syn keyword sqlKeyword BEFORE
syn keyword sqlKeyword BEGIN
syn keyword sqlKeyword BETWEEN
syn keyword sqlKeyword BY
syn keyword sqlKeyword CASCADE
syn keyword sqlKeyword CASE
syn keyword sqlKeyword CAST
syn keyword sqlKeyword CHECK
syn keyword sqlKeyword COLLATE
syn keyword sqlKeyword COLUMN
syn keyword sqlKeyword COMMIT
syn keyword sqlKeyword CONFLICT
syn keyword sqlKeyword CONSTRAINT
syn keyword sqlKeyword CREATE
syn keyword sqlKeyword CROSS
syn keyword sqlKeyword CURRENT_DATE
syn keyword sqlKeyword CURRENT_TIME
syn keyword sqlKeyword CURRENT_TIMESTAMP
syn keyword sqlKeyword DATABASE
syn keyword sqlKeyword DEFAULT
syn keyword sqlKeyword DEFERRABLE
syn keyword sqlKeyword DEFERRED
syn keyword sqlKeyword DELETE
syn keyword sqlKeyword DESC
syn keyword sqlKeyword DETACH
syn keyword sqlKeyword DISTINCT
syn keyword sqlKeyword DROP
syn keyword sqlKeyword EACH
syn keyword sqlKeyword ELSE
syn keyword sqlKeyword END
syn keyword sqlKeyword ESCAPE
syn keyword sqlKeyword EXCEPT
syn keyword sqlKeyword EXCLUSIVE
syn keyword sqlKeyword EXISTS
syn keyword sqlKeyword EXPLAIN
syn keyword sqlKeyword FAIL
syn keyword sqlKeyword FOR
syn keyword sqlKeyword FOREIGN
syn keyword sqlKeyword FROM
syn keyword sqlKeyword FULL
syn keyword sqlKeyword GLOB
syn keyword sqlKeyword GROUP
syn keyword sqlKeyword HAVING
syn keyword sqlKeyword IF
syn keyword sqlKeyword IGNORE
syn keyword sqlKeyword IMMEDIATE
syn keyword sqlKeyword IN
syn keyword sqlKeyword INDEX
syn keyword sqlKeyword INDEXED
syn keyword sqlKeyword INITIALLY
syn keyword sqlKeyword INNER
syn keyword sqlKeyword INSERT
syn keyword sqlKeyword INSTEAD
syn keyword sqlKeyword INTERSECT
syn keyword sqlKeyword INTO
syn keyword sqlKeyword IS
syn keyword sqlKeyword ISNULL
syn keyword sqlKeyword JOIN
syn keyword sqlKeyword KEY
syn keyword sqlKeyword LEFT
syn keyword sqlKeyword LIKE
syn keyword sqlKeyword LIMIT
syn keyword sqlKeyword MATCH
syn keyword sqlKeyword NATURAL
syn keyword sqlKeyword NO
syn keyword sqlKeyword NOT
syn keyword sqlKeyword NOTNULL
syn keyword sqlKeyword NULL
syn keyword sqlKeyword OF
syn keyword sqlKeyword OFFSET
syn keyword sqlKeyword ON
syn keyword sqlKeyword OR
syn keyword sqlKeyword ORDER
syn keyword sqlKeyword OUTER
syn keyword sqlKeyword PLAN
syn keyword sqlKeyword PRAGMA
syn keyword sqlKeyword PRIMARY
syn keyword sqlKeyword QUERY
syn keyword sqlKeyword RAISE
syn keyword sqlKeyword RECURSIVE
syn keyword sqlKeyword REFERENCES
syn keyword sqlKeyword REGEXP
syn keyword sqlKeyword REINDEX
syn keyword sqlKeyword RELEASE
syn keyword sqlKeyword RENAME
syn keyword sqlKeyword REPLACE
syn keyword sqlKeyword RESTRICT
syn keyword sqlKeyword RIGHT
syn keyword sqlKeyword ROLLBACK
syn keyword sqlKeyword ROW
syn keyword sqlKeyword SAVEPOINT
syn keyword sqlKeyword SELECT
syn keyword sqlKeyword SET
syn keyword sqlKeyword TABLE
syn keyword sqlKeyword TEMP
syn keyword sqlKeyword TEMPORARY
syn keyword sqlKeyword THEN
syn keyword sqlKeyword TO
syn keyword sqlKeyword TRANSACTION
syn keyword sqlKeyword TRIGGER
syn keyword sqlKeyword UNION
syn keyword sqlKeyword UNIQUE
syn keyword sqlKeyword UPDATE
syn keyword sqlKeyword USING
syn keyword sqlKeyword VACUUM
syn keyword sqlKeyword VALUES
syn keyword sqlKeyword VIEW
syn keyword sqlKeyword VIRTUAL
syn keyword sqlKeyword WHEN
syn keyword sqlKeyword WHERE
syn keyword sqlKeyword WITH
syn keyword sqlKeyword WITHOUT
hi def link sqlKeyword Special

" 40 distinct core functions f. https://www.sqlite.org/lang_corefunc.html
" sqlFunction group doesn't exist
syn match sqlFunction /abs(/me=e-1
syn match sqlFunction /changes(/me=e-1
syn match sqlFunction /char(/me=e-1
syn match sqlFunction /coalesce(/me=e-1
syn match sqlFunction /glob(/me=e-1
syn match sqlFunction /hex(/me=e-1
syn match sqlFunction /ifnull(/me=e-1
syn match sqlFunction /instr(/me=e-1
syn match sqlFunction /last_insert_rowid(/me=e-1
syn match sqlFunction /length(/me=e-1
syn match sqlFunction /like(/me=e-1
syn match sqlFunction /likelihood(/me=e-1
syn match sqlFunction /likely(/me=e-1
syn match sqlFunction /load_extension(/me=e-1
syn match sqlFunction /lower(/me=e-1
syn match sqlFunction /ltrim(/me=e-1
syn match sqlFunction /ltrim(/me=e-1
syn match sqlFunction /max(/me=e-1
syn match sqlFunction /min(/me=e-1
syn match sqlFunction /nullif(/me=e-1
syn match sqlFunction /printf(/me=e-1
syn match sqlFunction /quote(/me=e-1
syn match sqlFunction /random(/me=e-1
syn match sqlFunction /randomblob(/me=e-1
syn match sqlFunction /replace(/me=e-1
syn match sqlFunction /round(/me=e-1
syn match sqlFunction /rtrim(/me=e-1
syn match sqlFunction /soundex(/me=e-1
syn match sqlFunction /sqlite_compileoption_get(/me=e-1
syn match sqlFunction /sqlite_compileoption_used(/me=e-1
syn match sqlFunction /sqlite_source_id(/me=e-1
syn match sqlFunction /sqlite_version(/me=e-1
syn match sqlFunction /substr(/me=e-1
syn match sqlFunction /total_changes(/me=e-1
syn match sqlFunction /trim(/me=e-1
syn match sqlFunction /typeof(/me=e-1
syn match sqlFunction /unicode(/me=e-1
syn match sqlFunction /unlikely(/me=e-1
syn match sqlFunction /upper(/me=e-1
syn match sqlFunction /zeroblob(/me=e-1
" 5 date and time functions from https://www.sqlite.org/lang_datefunc.html
syn match sqlFunction /date(/me=e-1
syn match sqlFunction /time(/me=e-1
syn match sqlFunction /datetime(/me=e-1
syn match sqlFunction /julianday(/me=e-1
syn match sqlFunction /strftime(/me=e-1
" 7 aggregate functions from https://www.sqlite.org/lang_aggfunc.html
syn match sqlFunction /avg(/me=e-1
syn match sqlFunction /count(/me=e-1
syn match sqlFunction /group_concat(/me=e-1
"syn match sqlFunction /max(/me=e-1 " also a core function
"syn match sqlFunction /min(/me=e-1 " also a core function
syn match sqlFunction /sum(/me=e-1
syn match sqlFunction /total(/me=e-1
highlight def link sqlFunction Function
" 2 funtions from http://sqlite.org/cli.html
syn match sqlFunction /writefile(/me=e-1
syn match sqlFunction /readfile(/me=e-1
" 18 functions from https://sqlite.org/json1.html
syn match sqlFunction /json(/me=e-1
syn match sqlFunction /json_array(/me=e-1
syn match sqlFunction /json_array_length(/me=e-1
syn match sqlFunction /json_extract(/me=e-1
syn match sqlFunction /json_insert(/me=e-1
syn match sqlFunction /json_object(/me=e-1
syn match sqlFunction /json_remove(/me=e-1
syn match sqlFunction /json_replace(/me=e-1
syn match sqlFunction /json_set(/me=e-1
syn match sqlFunction /json_type(/me=e-1
syn match sqlFunction /json_type(/me=e-1
syn match sqlFunction /json_valid(/me=e-1
syn match sqlFunction /json_quote(/me=e-1
syn match sqlFunction /json_group_array(/me=e-1
syn match sqlFunction /json_group_object(/me=e-1
syn match sqlFunction /json_each(/me=e-1
syn match sqlFunction /json_tree(/me=e-1
syn match sqlFunction /json_tree(/me=e-1

" Adapted from GitHub:
" https://github.com/JessicaKMcIntosh/Vim/blob/master/syntax/sql.vim
syn match sqlSpecialCommand "^\.\w\+ .*$" contains=sqlString
highlight def link sqlSpecialCommand Define

" From syntax/sqloracle.vim
syn region sqlComment start="/\*" end="\*/" contains=sqlTodo
syn match sqlComment "--.*$" contains=sqlTodo
highlight def link sqlComment Comment
syn region sqlString start=+'+ skip=+\\\\\|\\'+ end=+'+
highlight def link sqlString String
syn match sqlNumber "\<-\=\d*\.\=[0-9_]\>"
highlight def link sqlNumber Number
syn case ignore
syn keyword sqlTodo contained TODO FIXME XXX DEBUG NOTE
highlight def link sqlTodo Todo

" Don't match other groups within column names
syn region sqlNone start=+"+ skip=+\\\\\|\\"+ end=+"+

" Must follow definition of sqlComment
syn region sqlFold1 start="^--\_s" end="^--\_s"me=s-1 fold transparent

let b:current_syntax = 'sql'
