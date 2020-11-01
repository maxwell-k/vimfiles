- [ ] Add instructions to the readme
- [ ] Add copyright and license, get `reuse` from the FSFE to pass
- [ ] Move to a separate repository
- [ ] Add CI to check `vim/site.yaml` succeeds on Alpine and Debian/Fedora
- [ ] Investigate using `vint` from pre-commit
- [ ] Check `.gitignore` is sorted from pre-commit (?)
- [ ] `shellcheck` is run from pre-commit on `.sh` files (?)
- [ ] Prettier on markdown (`*.md` and README) and YAML files from pre-commit (?)
- [ ] Remove rules for this repository from `../package.json`
- [ ] Add name and source to `.reuse/dep5`
- [ ] Run Vader and `runvimtests` in CI
- [ ] Run `vint` on all `.vim` files and `vimrc` from pre-commit (?)

# After publishing

- renovate bot to keep sub-modules up to date
- automate file-type-detection checks
- convert tests/README to markdown

<!--
README.md
Copyright 2020 Keith Maxwell
SPDX-License-Identifier: CC-BY-SA-4.0
-->
