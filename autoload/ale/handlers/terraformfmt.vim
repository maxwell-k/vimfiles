" Author: Keith Maxwell <keith.maxwell@gmail.com>
" Description: Functions for working with terraform fmt for checking or fixing

" Shared between the linter and fixer
call ale#Set('terraform_terraformfmt_executable', 'terraform')

function! ale#handlers#terraformfmt#GetExecutable(buffer) abort
  return ale#Var(a:buffer, 'terraform_terraformfmt_executable')
endfunction
