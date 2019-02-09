let b:ale_linters_ignore = ['ansible-lint']
call ale#linter#Define('ansible', {
\   'name': 'ansible_lint_no_405',
\   'executable_callback': 'ale_linters#ansible#ansible_lint#GetExecutable',
\   'command': '%e -x 405 -p %t',
\   'callback': 'ale_linters#ansible#ansible_lint#Handle',
\})
