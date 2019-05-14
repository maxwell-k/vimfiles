" Edit with: vim -o test-transform.vim test-transform.msgok
" For efficient development replace the local copy of opfunc.vim in
" /usr/share/vim/vimfiles/autoload/ with a symbolic link file.
echo opfunc#transform('0')
echo opfunc#dedent('  1')
echo opfunc#transform('  2')
echo opfunc#transform("  3 \\\n  4")
echo opfunc#transform("5 ^\n6")
echo opfunc#transform('7  8')
echo opfunc#transform("# 9\n# 10")
echo opfunc#transform("11\n12")
echo opfunc#transform("13\n14 ")
echo opfunc#transform("15\n\\ 16")
echo opfunc#transform("  17\n    \\ 18")
quit
