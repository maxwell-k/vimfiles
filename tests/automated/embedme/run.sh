cp missing.md example.md \
&& vim \
  "+edit example.md" \
  '+normal \aq' \
&& git diff --exit-code example.md
