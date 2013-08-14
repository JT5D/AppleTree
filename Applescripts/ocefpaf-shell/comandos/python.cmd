# create source distribution
python setup.py sdist [--formats=bztar]

# upload
python setup.py sdist [--formats=gztar] upload

# install
python setup.py install

# build binary info
python setup.py bdist --help-formats
python setup.py bdist_rpm --spec-only

# check reST
python setup.py --long-description | rst2html.py > tmp.html

# check setup.py
python setup.py check

# register to pypi
python setup.py register

# development version
python setup.py sdist --dev

# webserver:
python -m SimpleHTTPServer 8080

# run doctest
py -m doctest -v csiro.py

# run pylint like checker
pychecker --only map.py

# pygments
pygmentize -f latex -O full -o test.tex water_properties.py

# profiling
gprof executable | gprof2dot.py | dot -Tpng -o profile.png

nosetests --with-profile --profile-stats-file stats.pf test_performance

python -m profile -o output.pstats path/to/your/script args
gprof2dot.py -f pstats output.pstats | dot -Tpng -o output.png

# python cProfile (formerly known as lsprof)
python -m cProfile -o output.pstats path/to/your/script args
gprof2dot.py -f pstats output.pstats | dot -Tpng -o output.png
# or kcachegrind
pyprof2calltree -i profile_data.pyprof -k
