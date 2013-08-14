# d: stands for DEFINE.
curl dict://dict.org/d:YourWord

# he dict.org web site supports 77 dictionaries. To list them:
curl dict://dict.org/show:db

# foldoc "The Free On-line Dictionary of Computing" like this:
curl dict://dict.org/d:bash:foldoc

# display results from all libraries, do this:
curl dict://dict.org/d:bash:*

# fuzzy matching is also possible
curl dict://dict.org/m:bash

# strategy: prefix, suffix, or even soundex
#curl dict://dict.org/m:bash::prefix

# list all supported strategies
curl dict://dict.org/show:strat

# sudo zypper install wordnet
wn break -synsn
