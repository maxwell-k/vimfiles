```txt
tests/manual/example.md
Copyright 2024 Keith Maxwell
SPDX-License-Identifier: CC0-1.0
```

<http://example.com>

<name@example.com>

> This is a test to see if spell checking is enabled. Spelling mistakes are not
> highlighted: asdf, qwer, zcv.
>
> URLS are included: <http://example.org>

Command to demonstrate `echo`:

    echo Example command

[official]:
  https://example.com/a-really-long-slug-that-causes-the-link-destination-to-be-formatted-on-the-second-line-asdf

A misspelled word in a paragraph both single and double quotes: "asdf" 'asdf'.

# A misspelled word in a heading both single and double quotes: "asdf" 'asdf'

~~A misspelled word in a strike through both single and double quotes: "asdf"
'asdf'.~~

This is a sentence with a footnote at the end [^1].

[^1]:
    This is a footnote. The first word should be highlighted as the other
    colours. The number in brackets should be a `markdownFootnoteDefinition` as
    defined in `/usr/share/vim/vim91/syntax/markdown.vim`. This is repeated in
    `./after/syntax/markdown.vim` as it is ineffective in the first file.
