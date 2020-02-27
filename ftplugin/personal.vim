" Use as set filetype=python.black.personal
" This filetype configures more options, auto formatting and linting to match
" my personal preferences
let b:ale_python_black_options = '--line-length 79'
let b:ale_fixers = get(b:, 'ale_fixers', []) + ['isort']
let b:ale_linters = ['flake8']
