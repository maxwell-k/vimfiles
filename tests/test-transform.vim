" Edit with: vim -o test-transform.vim test-transform.msgok
" For efficient development replace the local copy of opfunc.vim in
" /usr/share/vim/vimfiles/autoload/ with a link: with a symbolic link to this
" file.
echo opfunc#transform('0')
echo opfunc#dedent('  1')
echo opfunc#transform('  2')
echo opfunc#transform("  3 \\\n  4")
echo opfunc#transform("5 ^\n6")
echo opfunc#transform('7  8')
echo opfunc#transform("# 9\n# 10")
echo opfunc#transform("11\n12")
echo opfunc#transform("13\n14 ")
" From ``:help line-continuation``
" Long lines in a ":source"d Ex command script file can be split by inserting
" a line continuation symbol "\" (backslash) at the start of the next line.
" There can be white space before the backslash, which is ignored.
echo opfunc#transform("15\n\\ 16")
echo opfunc#transform("  17\n    \\ 18")
quit
