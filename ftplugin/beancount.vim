packadd beancount
set commentstring=;%s
call ale#fix#registry#Add('beanformat', 'ale#fixers#beanformat#Fix',
  \ ['beancount'], 'Format with bean-format')
let b:ale_linters=['bean_check',]
let b:ale_fixers = ['beanformat',]
