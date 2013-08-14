# at the doc dir issue:
sphinx-quickstart

> autodoc: automatically insert docstrings from modules (y/N) [n]: y
> doctest: automatically test code snippets in doctest blocks (y/N) [n]:
> intersphinx: link between Sphinx documentation of different projects (y/N) [n]:
> todo: write "todo" entries that can be shown or hidden on build (y/N) [n]:
> coverage: checks for documentation coverage (y/N) [n]:
> pngmath: include math, rendered as PNG images (y/N) [n]:
> jsmath: include math, rendered in the browser by JSMath (y/N) [n]:
> ifconfig: conditional inclusion of content based on config values (y/N) [n]: 
> Create Makefile? (Y/n) [y]:
> Create Windows command file? (Y/n) [y]: n

make html
make latex
cd _build/latex
make all-pdf

