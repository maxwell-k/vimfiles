packadd beancount
setlocal commentstring=;%s
call ale#fix#registry#Add('beanformat', 'ale#fixers#beanformat#Fix',
  \ ['beancount'], 'Format with bean-format')
let b:ale_fixers = ['beanformat', 'trim_whitespace',]
" bean_check ale_linter is from https://github.com/nathangrigg/vim-beancount
" see tasks/beancount.yaml
let b:ale_linters=['bean_check',]
