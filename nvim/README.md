<!--
nvim/README.md
Copyright 2022 Keith Maxwell
SPDX-License-Identifier: CC-BY-SA-4.0
-->

This configuration for <https://neovim.io/> is experimental.

To configure `nvim` to pick up these settings use:

    ln -s ~/.vim/nvim ~/.config/nvim

These settings assume nightly builds for Fedora from
<https://copr.fedorainfracloud.org/coprs/agriffis/neovim-nightly/> because:

- Under `:help lsp` the first step is to install [`nvim-lspconfig`]
- `nvim-lspconfig` requires latest stable release or Nightly
- Latest stable today is 0.7.2 according to
  <https://github.com/neovim/neovim/releases/latest>
- 0.7.2 is in Fedora Rawhide but hasn't been released for Fedora 35 or 36

[`nvim-lspconfig`]: https://github.com/neovim/nvim-lspconfig
