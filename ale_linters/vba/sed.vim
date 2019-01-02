call ale#linter#Define(fnamemodify(expand('<sfile>:p:h'), ':t'), {
\   'name': 'sed',
\   'executable': 'sed',
\   'command_callback': 'sed#GetCommand',
\   'callback': 'sed#Handle',
\   'output_stream': 'stdout',
\})
