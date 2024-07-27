" syntax/sqlite.vim
" Copyright 2020 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
syntax case match "encourage consistency in capitalisation

" 4 sqlite types from https://www.sqlite.org/datatype3.html
syntax keyword sqlType INTEGER
syntax keyword sqlType REAL
syntax keyword sqlType TEXT
syntax keyword sqlType BLOB
highlight default link sqlType Type

" 124 sqlite keywords from https://www.sqlite.org/lang_keywords.html
syntax keyword sqlKeyword ABORT
syntax keyword sqlKeyword ACTION
syntax keyword sqlKeyword ADD
syntax keyword sqlKeyword AFTER
syntax keyword sqlKeyword ALL
syntax keyword sqlKeyword ALTER
syntax keyword sqlKeyword ANALYZE
syntax keyword sqlKeyword AND
syntax keyword sqlKeyword AS
syntax keyword sqlKeyword ASC
syntax keyword sqlKeyword ATTACH
syntax keyword sqlKeyword AUTOINCREMENT
syntax keyword sqlKeyword BEFORE
syntax keyword sqlKeyword BEGIN
syntax keyword sqlKeyword BETWEEN
syntax keyword sqlKeyword BY
syntax keyword sqlKeyword CASCADE
syntax keyword sqlKeyword CASE
syntax keyword sqlKeyword CAST
syntax keyword sqlKeyword CHECK
syntax keyword sqlKeyword COLLATE
syntax keyword sqlKeyword COLUMN
syntax keyword sqlKeyword COMMIT
syntax keyword sqlKeyword CONFLICT
syntax keyword sqlKeyword CONSTRAINT
syntax keyword sqlKeyword CREATE
syntax keyword sqlKeyword CROSS
syntax keyword sqlKeyword CURRENT_DATE
syntax keyword sqlKeyword CURRENT_TIME
syntax keyword sqlKeyword CURRENT_TIMESTAMP
syntax keyword sqlKeyword DATABASE
syntax keyword sqlKeyword DEFAULT
syntax keyword sqlKeyword DEFERRABLE
syntax keyword sqlKeyword DEFERRED
syntax keyword sqlKeyword DELETE
syntax keyword sqlKeyword DESC
syntax keyword sqlKeyword DETACH
syntax keyword sqlKeyword DISTINCT
syntax keyword sqlKeyword DROP
syntax keyword sqlKeyword EACH
syntax keyword sqlKeyword ELSE
syntax keyword sqlKeyword END
syntax keyword sqlKeyword ESCAPE
syntax keyword sqlKeyword EXCEPT
syntax keyword sqlKeyword EXCLUSIVE
syntax keyword sqlKeyword EXISTS
syntax keyword sqlKeyword EXPLAIN
syntax keyword sqlKeyword FAIL
syntax keyword sqlKeyword FOR
syntax keyword sqlKeyword FOREIGN
syntax keyword sqlKeyword FROM
syntax keyword sqlKeyword FULL
syntax keyword sqlKeyword GLOB
syntax keyword sqlKeyword GROUP
syntax keyword sqlKeyword HAVING
syntax keyword sqlKeyword IF
syntax keyword sqlKeyword IGNORE
syntax keyword sqlKeyword IMMEDIATE
syntax keyword sqlKeyword IN
syntax keyword sqlKeyword INDEX
syntax keyword sqlKeyword INDEXED
syntax keyword sqlKeyword INITIALLY
syntax keyword sqlKeyword INNER
syntax keyword sqlKeyword INSERT
syntax keyword sqlKeyword INSTEAD
syntax keyword sqlKeyword INTERSECT
syntax keyword sqlKeyword INTO
syntax keyword sqlKeyword IS
syntax keyword sqlKeyword ISNULL
syntax keyword sqlKeyword JOIN
syntax keyword sqlKeyword KEY
syntax keyword sqlKeyword LEFT
syntax keyword sqlKeyword LIKE
syntax keyword sqlKeyword LIMIT
syntax keyword sqlKeyword MATCH
syntax keyword sqlKeyword NATURAL
syntax keyword sqlKeyword NO
syntax keyword sqlKeyword NOT
syntax keyword sqlKeyword NOTNULL
syntax keyword sqlKeyword NULL
syntax keyword sqlKeyword OF
syntax keyword sqlKeyword OFFSET
syntax keyword sqlKeyword ON
syntax keyword sqlKeyword OR
syntax keyword sqlKeyword ORDER
syntax keyword sqlKeyword OUTER
syntax keyword sqlKeyword PLAN
syntax keyword sqlKeyword PRAGMA
syntax keyword sqlKeyword PRIMARY
syntax keyword sqlKeyword QUERY
syntax keyword sqlKeyword RAISE
syntax keyword sqlKeyword RECURSIVE
syntax keyword sqlKeyword REFERENCES
syntax keyword sqlKeyword REGEXP
syntax keyword sqlKeyword REINDEX
syntax keyword sqlKeyword RELEASE
syntax keyword sqlKeyword RENAME
syntax keyword sqlKeyword REPLACE
syntax keyword sqlKeyword RESTRICT
syntax keyword sqlKeyword RIGHT
syntax keyword sqlKeyword ROLLBACK
syntax keyword sqlKeyword ROW
syntax keyword sqlKeyword SAVEPOINT
syntax keyword sqlKeyword SELECT
syntax keyword sqlKeyword SET
syntax keyword sqlKeyword TABLE
syntax keyword sqlKeyword TEMP
syntax keyword sqlKeyword TEMPORARY
syntax keyword sqlKeyword THEN
syntax keyword sqlKeyword TO
syntax keyword sqlKeyword TRANSACTION
syntax keyword sqlKeyword TRIGGER
syntax keyword sqlKeyword UNION
syntax keyword sqlKeyword UNIQUE
syntax keyword sqlKeyword UPDATE
syntax keyword sqlKeyword USING
syntax keyword sqlKeyword VACUUM
syntax keyword sqlKeyword VALUES
syntax keyword sqlKeyword VIEW
syntax keyword sqlKeyword VIRTUAL
syntax keyword sqlKeyword WHEN
syntax keyword sqlKeyword WHERE
syntax keyword sqlKeyword WITH
syntax keyword sqlKeyword WITHOUT
highlight default link sqlKeyword Special

" 40 distinct core functions f. https://www.sqlite.org/lang_corefunc.html
" sqlFunction group doesn't exist
syntax match sqlFunction /abs(/me=e-1
syntax match sqlFunction /changes(/me=e-1
syntax match sqlFunction /char(/me=e-1
syntax match sqlFunction /coalesce(/me=e-1
syntax match sqlFunction /glob(/me=e-1
syntax match sqlFunction /hex(/me=e-1
syntax match sqlFunction /ifnull(/me=e-1
syntax match sqlFunction /instr(/me=e-1
syntax match sqlFunction /last_insert_rowid(/me=e-1
syntax match sqlFunction /length(/me=e-1
syntax match sqlFunction /like(/me=e-1
syntax match sqlFunction /likelihood(/me=e-1
syntax match sqlFunction /likely(/me=e-1
syntax match sqlFunction /load_extension(/me=e-1
syntax match sqlFunction /lower(/me=e-1
syntax match sqlFunction /ltrim(/me=e-1
syntax match sqlFunction /ltrim(/me=e-1
syntax match sqlFunction /max(/me=e-1
syntax match sqlFunction /min(/me=e-1
syntax match sqlFunction /nullif(/me=e-1
syntax match sqlFunction /printf(/me=e-1
syntax match sqlFunction /quote(/me=e-1
syntax match sqlFunction /random(/me=e-1
syntax match sqlFunction /randomblob(/me=e-1
syntax match sqlFunction /replace(/me=e-1
syntax match sqlFunction /round(/me=e-1
syntax match sqlFunction /rtrim(/me=e-1
syntax match sqlFunction /soundex(/me=e-1
syntax match sqlFunction /sqlite_compileoption_get(/me=e-1
syntax match sqlFunction /sqlite_compileoption_used(/me=e-1
syntax match sqlFunction /sqlite_source_id(/me=e-1
syntax match sqlFunction /sqlite_version(/me=e-1
syntax match sqlFunction /substr(/me=e-1
syntax match sqlFunction /total_changes(/me=e-1
syntax match sqlFunction /trim(/me=e-1
syntax match sqlFunction /typeof(/me=e-1
syntax match sqlFunction /unicode(/me=e-1
syntax match sqlFunction /unlikely(/me=e-1
syntax match sqlFunction /upper(/me=e-1
syntax match sqlFunction /zeroblob(/me=e-1
" 5 date and time functions from https://www.sqlite.org/lang_datefunc.html
syntax match sqlFunction /date(/me=e-1
syntax match sqlFunction /time(/me=e-1
syntax match sqlFunction /datetime(/me=e-1
syntax match sqlFunction /julianday(/me=e-1
syntax match sqlFunction /strftime(/me=e-1
" 7 aggregate functions from https://www.sqlite.org/lang_aggfunc.html
syntax match sqlFunction /avg(/me=e-1
syntax match sqlFunction /count(/me=e-1
syntax match sqlFunction /group_concat(/me=e-1
"syn match sqlFunction /max(/me=e-1 " also a core function
"syn match sqlFunction /min(/me=e-1 " also a core function
syntax match sqlFunction /sum(/me=e-1
syntax match sqlFunction /total(/me=e-1
highlight default link sqlFunction Function
" 2 funtions from http://sqlite.org/cli.html
syntax match sqlFunction /writefile(/me=e-1
syntax match sqlFunction /readfile(/me=e-1
" 18 functions from https://sqlite.org/json1.html
syntax match sqlFunction /json(/me=e-1
syntax match sqlFunction /json_array(/me=e-1
syntax match sqlFunction /json_array_length(/me=e-1
syntax match sqlFunction /json_extract(/me=e-1
syntax match sqlFunction /json_insert(/me=e-1
syntax match sqlFunction /json_object(/me=e-1
syntax match sqlFunction /json_remove(/me=e-1
syntax match sqlFunction /json_replace(/me=e-1
syntax match sqlFunction /json_set(/me=e-1
syntax match sqlFunction /json_type(/me=e-1
syntax match sqlFunction /json_type(/me=e-1
syntax match sqlFunction /json_valid(/me=e-1
syntax match sqlFunction /json_quote(/me=e-1
syntax match sqlFunction /json_group_array(/me=e-1
syntax match sqlFunction /json_group_object(/me=e-1
syntax match sqlFunction /json_each(/me=e-1
syntax match sqlFunction /json_tree(/me=e-1
syntax match sqlFunction /json_tree(/me=e-1

" https://www.sqlite.org/cli.html#special_commands_to_sqlite3_dot_commands_
syntax match sqlSpecialCommand
  \ "^\.\(help\|databases\|excel\|expert\|quit\|show\|vfslist\)$"
syntax match sqlSpecialCommand "^\.archive .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.auth .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.backup .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.bail .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.binary .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.cd .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.changes .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.checkclone .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.dbconfig .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.dbinfo .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.dump .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.echo .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.eqp .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.exit .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.fullschema .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.headers .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.help .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.import .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.imposter .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.indexes .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.iotrace .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.limit .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.lint .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.load .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.log .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.mode .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.nullvalue .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.once .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.open .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.output .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.parameter .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.print .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.progress .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.prompt .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.read .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.restore .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.save .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.scanstats .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.schema .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.selftest .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.separator .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.session .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.sha3sum .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.shell .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.stats .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.system .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.tables .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.testcase .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.timeout .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.timer .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.trace .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.vfsinfo .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.vfsname .\+$" contains=sqlString
syntax match sqlSpecialCommand "^\.width .\+$" contains=sqlString
highlight default link sqlSpecialCommand Define

" Comments
syntax region sqlComment start="/\*" end="\*/" contains=sqlTodo
syntax match sqlComment "--.*$" contains=sqlTodo
highlight default link sqlComment Comment
syntax region sqlString start=+'+ skip=+\\\\\|\\'+ end=+'+
highlight default link sqlString String
syntax match sqlNumber "\<-\=\d*\.\=[0-9_]\>"
highlight default link sqlNumber Number
syntax case ignore
syntax keyword sqlTodo contained TODO FIXME XXX DEBUG NOTE
highlight default link sqlTodo Todo

" Don't match other groups within column names
syntax region sqlNone start=+"+ skip=+\\\\\|\\"+ end=+"+

" Must follow definition of sqlComment
syntax region sqlFold1 start="^--\_s" end="^--\_s"me=s-1 fold transparent

let b:current_syntax = 'sql'
