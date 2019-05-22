#!/bin/sh
# For some reason a second test causes from the same file causes an error
vader() {
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
		runVimTests test-transform.vim ||
		{ printf 'runVimTest pure tests failed\n'; exit 1 ; }
		runVimTests --user test-dbext.vim ||
		{ printf 'runVimTest user tests failed\n'; exit 1 ; }
		vader index.vader ||
		{ printf 'vader tests failed\n'; exit 1 ; }
		unset -f vader vader_no_bang ;
		;;
esac
