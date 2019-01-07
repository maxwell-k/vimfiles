#!/bin/sh
# For some reason a second test causes from the same file causes an error
vader() {
	vim "+packadd vader | Vader! $1"
}
vader_no_bang() {
	vim "+packadd vader | Vader $1"
}
case "$0" in
	-*)
		;;
	*)
		runVimTests.sh test-transform.vim ||
		{ printf 'runVimTest pure tests failed\n'; exit 1 ; }
		runVimTests.sh --user test-dbext.vim ||
		{ printf 'runVimTest user tests failed\n'; exit 1 ; }
		vader index.vader ||
		{ printf 'vader tests failed\n'; exit 1 ; }
		unset -f vader vader_no_bang ;
		;;
esac
