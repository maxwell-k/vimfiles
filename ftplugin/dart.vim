packadd dart
let b:ale_fixers = ['dartfmt',]
let b:ale_linters = ['language_server'] " dartanalyzer does the same analysis
set omnifunc=ale#completion#OmniFunc
