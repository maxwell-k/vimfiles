<!-- vim: set filetype=markdown.embedme : -->

To test the `embedme` fixer from `autoload/ale/fixers/embedme.vim` and
`ftplugin/embedme.vim`:

1. Delete the three echo lines in each code block below
2. Save the file
3. The fixer should automatically add back three echo lines from `./example.sh`

<!-- embedme example.sh -->

```sh
#!/bin/sh
echo 1
echo 2
echo 3

```

```sh
# example.sh

#!/bin/sh
echo 1
echo 2
echo 3

```
