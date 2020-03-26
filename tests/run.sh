#!/bin/sh
# tests/run.sh
# Copyright 2020 Keith Maxwell
# SPDX-License-Identifier: MPL-2.0
#
# For some reason a second test from the same file causes an error
vader() {
	# hangs if run with -es
	vim "+packadd vader | Vader! $1"
}
vader_no_bang() {
	# For debugging with . ./run.sh ; vader_no_bang index.vader
	vim "+packadd vader | Vader $1"
}
case "$0" in
	-*)
		;;
	*)
		vader index.vader ||
		{ printf 'vader tests failed\n'; exit 1 ; }
		runVimTests test-transform.vim ||
		{ printf 'runVimTest pure tests failed\n'; exit 1 ; }
		runVimTests --user test-dbext.vim ||
		{ printf 'runVimTest user tests failed\n'; exit 1 ; }
		unset -f vader vader_no_bang ;
		;;
esac
