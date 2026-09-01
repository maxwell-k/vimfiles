# Spectral

Today my personal fork of ALE contains changes to the handler for the spectral
linter to parse JSON output instead of text format output. To manually verify
those changes open each of two files:

    example.json
    example.yaml

ALE should highlight an error:

    spectral says `Object must have required property "example"`

---

For testing, including the example below, it is helpful to have spectral on the
PATH.

Command to add `~/.vim/bin` to `PATH`:

    export PATH=$HOME/.vim/bin:$PATH

---

The [existing handler] parses the text format output from spectral using regular
expressions. For example:

        let l:code_match = matchlist(l:obj.text, '\v^(.+) "(.+)"$')

This does not handle nested quotes. Nested quotes often appear in spectral
output. For example, using the files in this directory,
`spectral lint --format text example.json | cat` shows the following output:

> /home/maxwell-k/.vim/test/manual/spectral/example.json:1:1 error
> root-array-items-have-date "Object must have required property "example""%

The text that should be parsed from this error is:

    Object must have required property "example"

The text that is actually parsed from this error is:

    example"

[existing handler]:
  https://github.com/dense-analysis/ale/blob/master/autoload/ale/handlers/spectral.vim

<!--
test/manual/spectral/README.md
Copyright 2026 Keith Maxwell
SPDX-License-Identifier: CC0-1.0
-->
