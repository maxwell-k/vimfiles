packadd terraform
setlocal commentstring=#%s
call ale#fix#registry#Add('terraformfmt', 'ale#fixers#terraformfmt#Fix',
  \ ['terraform'], 'Format with terraform fmt')
let b:ale_fixers = ['terraformfmt',]
