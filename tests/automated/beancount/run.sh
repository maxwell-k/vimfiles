# sed may not be portable across systems e.g. BSD uses -I, BusyBox -i
vim -u NONE \
  "+edit example.beancount" \
  '+%s/^  Assets:Cash\s\+/  Assets:Cash /' \
  "+wq" \
&& vim \
  "+edit example.beancount" \
  '+normal \aq' \
&& git diff --exit-code example.beancount
