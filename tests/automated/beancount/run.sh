#!/bin/sh
# tests/automated/beancount/run.sh
# Copyright 2021 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0

# sed may not be portable across systems e.g. BSD uses -I, BusyBox -i, so vim
# is used instead

# Beancount is an application implemented in Python and C. An up to date,
# Beancount system package is not available for Fedora. Python 3.10 was
# released more recently than the last version of beancount. Compiled C
# artifacts for beancount are therefore not available on PyPI. One option is to
# install beancount as:
#
#   dnf install -y gcc python-devel && pipx install beancount
#
# Subjectively these are a "heavy" set of dependencies. To avoid install these,
# instead the beancount tests are not run if Beancount — `bean-format`
# specifically — is not installed.


if bean-format --version >/dev/null 2>/dev/null ; then
  vim -u NONE \
    "+edit example.beancount" \
    '+%s/^  Assets:Cash\s\+/  Assets:Cash /' \
    "+wq" \
  && vim \
    "+edit example.beancount" \
    '+normal \aq' \
  && git diff --exit-code example.beancount
fi
