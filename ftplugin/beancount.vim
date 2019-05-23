packadd beancount
set commentstring=;%s
let b:ale_fixers = ['beanformat', 'trim_whitespace',]
" bean_check ale_linter is from https://github.com/nathangrigg/vim-beancount
" see tasks/beancount.yaml
let b:ale_linters=['bean_check',]
