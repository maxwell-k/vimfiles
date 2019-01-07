" adapted from /usr/share/vim/vimfiles/pack/ac/start/elixir/syntax/elixir.vim
syn clear elixirString
syn region elixirString
  \ matchgroup=elixirStringDelimiter
  \ start=+\z('\)+
  \ end=+\z1+ skip=+\\\\\|\\\z1+
  \ contains=@NoSpell,@elixirStringContained
syn region elixirString
  \ matchgroup=elixirStringDelimiter
  \ start=+\z("\)+
  \ end=+\z1+ skip=+\\\\\|\\\z1+
  \ contains=@NoSpell,@elixirStringContained
syn region elixirString
  \ matchgroup=elixirStringDelimiter
  \ start=+\z('''\)+
  \ end=+^\s*\z1+
  \ contains=@NoSpell,@elixirStringContained
syn region elixirString
  \ matchgroup=elixirStringDelimiter
  \ start=+\z("""\)+
  \ end=+^\s*\z1+
  \ contains=@NoSpell,@elixirStringContained
