packadd dart
let b:ale_fixers = ['dartfmt',]
let b:ale_linters = ['language_server'] " dartanalyzer does the same analysis
setlocal omnifunc=ale#completion#OmniFunc
