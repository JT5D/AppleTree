find . -type d | sed -e "s~[^-][^/]*/~ |~g" -e "s~|\([^ ]\)~|-\1~"
find . -print |sed -e 's~[^/]*/\([^/]*\)$~\\--\1~' -e 's~[^/]*/~
