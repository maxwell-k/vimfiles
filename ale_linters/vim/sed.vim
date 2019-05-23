call ale#linter#Define(fnamemodify(expand('<sfile>:p:h'), ':t'), {
\   'name': 'sed',
\   'executable': 'sed',
\   'command': function('sed#GetCommand'),
\   'callback': 'sed#Handle',
\   'output_stream': 'stdout',
\})
