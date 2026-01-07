#!/bin/sh
# Debug wrapper script for ALE commands
# let b:ale_command_wrapper = '~/.vim/bin/ale_command_wrapper.sh'
#
# bin/ale_command_wrapper.sh
# Copyright 2026 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
#
test -d ~/vim/log || mkdir --parents ~/.vim/log
exec tee ~/.vim/log/stdin | "$@" 2>~/.vim/log/stderr | tee ~/.vim/log/stdout
