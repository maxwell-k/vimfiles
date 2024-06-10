" ftplugin/cpp.vim
" Copyright 2024 Keith Maxwell
" SPDX-License-Identifier: MPL-2.0
"
let b:ale_cpp_cc_options = '-std=c++20 -Wall'
let b:ale_cpp_cc_options .= ' -I/usr/include/python3.11/'
let b:ale_cpp_cc_options .= ' -IThirdParty/eigen-3.4.0'
let b:ale_cpp_cc_options .=
  \ ' -I.venv/lib/python3.11/site-packages/pybind11/include/'
