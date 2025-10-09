#!/bin/sh
# tests/automated/spellcheck.sh
# Copyright 2024 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
echo "Text with no spelling mistakes." \
| vim '+call spellcheck#Exit()' - \
&& ! vim '+normal iA single spelling mistake: asdf' '+call spellcheck#Exit()'
