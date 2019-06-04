"""
" Jupyter.vim
" -----------
"
" Carefully commented to be valid Python and vim script to enable
" testing with ``python -i jupyter.vim`` and autoloading in ``vim``.
"
" Depends upon opfunc.vim
"
" Configurable with one option:
"
" g:jupyter_output ==# 'echo' | 'inline' | ...
"
" 1.  Echo the output in the message area or
" 2.  Put the output on its own in a new window or
" 3.  Put the output below the executed text
"
" Tested with a Jupyter Python or Bash [#]_ console:
"
"     python -m jupyter_console
"     python -m jupyter_console --kernel bash
"
" .. _[#]: See https://github.com/takluyver/bash_kernel for bash kernel
"     installation
"
" Set up mappings like the following in your vimrc:
"
"     nmap <Leader>j :set opfunc=jupyter#opfunc<CR>g@
"     vmap <Leader>j :<C-U>call jupyter#opfunc(visualmode(), 1)<CR>
"     nmap <Leader>jj :<C-U>call jupyter#opfunc(v:count1)<CR>
"     command! -nargs=+ Jupyter :call jupyter#command(<q-args>)
"
" Be careful with the timing of jj, a delay in between will produce call two
" lines through …g@j
"
" ``:call jupyter#load()`` for testing and to make vim autoload the
" ``:python3`` functions
"
scriptencoding utf-8
if !has('python3') | finish | endif
" Main body of python code {{{
python3 << """
from queue import Empty
from textwrap import dedent, indent

NOTHING = 'jupyter.vim: no response from kernel (queue.Empty)'

try:
    from jupyter_client.blocking.client import BlockingKernelClient
    from jupyter_client import find_connection_file
except ImportError:
    pass


TIMEOUT = 3  # jupyter_send should take at most TIMEOUT seconds
MESSAGES = 10  # jupyter_send reads at most MESSAGES messages


def dedent_prefix(original):
    r'''Return text and the common leading whitespace

    >>> dedent_prefix('  hello world')
    ('hello world', '  ')

    >>> dedent_prefix('  hello world\n    hello again')
    ('hello world\n  hello again', '  ')
    '''
    text = dedent(original)
    prefix = original[:original.find(text.splitlines(True)[0])]
    return text, prefix


def jupyter_send(text):
    '''Send the text to jupyter, return the result

    >>> jupyter_send('1+1')
    '2'

    >>> jupyter_send('a = 1')
    'jupyter.vim: no response from kernel (queue.Empty)'

    >>> jupyter_send('not_defined()')
    "NameError: name 'not_defined' is not defined"
    '''
    if ('find_connection_file' not in globals() or
            'BlockingKernelClient' not in globals()):
        raise RuntimeError('Jupyter not available')

    file_ = find_connection_file()
    client = BlockingKernelClient(connection_file=file_)

    client.load_connection_file()
    client.start_channels()
    client.execute(text)
    try:
        msg = client.get_shell_msg(block=True, timeout=TIMEOUT / 2)
        assert msg['content']['status'] == 'ok', 'Status was not OK'
    except Empty:
        pass  # for example bash kernel with a sleep 10
    try:
        for i in range(MESSAGES):
            try:
                msg = client.get_iopub_msg(
                    block=True, timeout=TIMEOUT/2/MESSAGES)
            except Empty:
                pass
            if msg['msg_type'] == 'execute_result':
                result = msg['content']['data']['text/plain']
                break
            elif msg['msg_type'] == 'stream':
                result = msg['content']['text'].rstrip('\n')
                break
            elif msg['msg_type'] == 'error':
                result = "{}: {}".format(
                    msg['content']['ename'],
                    msg['content']['evalue'],
                    )
                break
        else:
            result = NOTHING
    finally:
        client.stop_channels()
    return result

"""
python3 from vim import eval as veval
let s:nothing = py3eval('NOTHING')
" }}}
function! jupyter#j(type, ...) abort "{{{
    let l:sel_save = &selection | let &selection = 'inclusive'
    let l:reg_save = @@ " unnamed register

    call opfunc#opfuncInput(a:type, a:0)
    call jupyter#main()
    let &selection = l:sel_save | let @@ = l:reg_save
endfunction " }}}
function! jupyter#main() abort " {{{
    let g:jupyter_output = get(g:, 'jupyter_output', 'window')
    if g:jupyter_output ==# 'echo'
        pclose
        python3 print(jupyter_send(dedent(veval('@@'))))
    elseif g:jupyter_output ==# 'inline'
        pclose
        python3 code, prefix = dedent_prefix(veval('@@'))
        let @@=py3eval('indent(jupyter_send(code), prefix)')
        if @@ =~# ' *'.s:nothing
            echo s:nothing
        else
            normal! `>
            put
        endif
    else " window
        if !exists('g:jupyter_buffer')
            " Create and setup the buffer
            let g:jupyter_buffer = bufnr('Jupyter', 1)
            call setbufvar('Jupyter', '&buftype', 'nofile')
            call setbufvar('Jupyter', '&bufhidden', 'hide')
            call setbufvar('Jupyter', '&swapfile', '0')
            call setbufvar('Jupyter', '&filetype', 'python')
        endif

        silent pedit Jupyter
        call setbufvar('Jupyter', '&buflisted', '0')
        let l:win_save = bufwinnr('%')
        wincmd P
        %delete
        let @@=py3eval("jupyter_send(dedent(veval('@@')))")
        if @@ ==# s:nothing
            pclose
            echo s:nothing
        else
            silent put "
            1delete
            echo
        endif
        execute l:win_save . 'wincmd w'
    endif
endfunction "}}}
function! jupyter#command(value) abort "{{{
    let l:reg_save = @@
    let @@ = a:value
    call jupyter#main()
    let @@ = l:reg_save
endfunction "}}}
function! jupyter#toggle() abort " {{{
    let g:jupyter_output = get(g:, 'jupyter_output', 'window')
    let l:values = {'window': 'echo', 'echo': 'inline', 'inline': 'window', }
    let g:jupyter_output = l:values[g:jupyter_output]
    let g:jupyter_output
endfunction " }}}
function! jupyter#load() abort
    echom 'jupyter.vim loaded'
endfunction
