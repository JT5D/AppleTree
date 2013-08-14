# open script with default editor and do not execute when done
edit -x script.py

# open commands 1-3 and 6 from history in editor
edit 1-3 6

# saves the history commands 1-3 and 5 in the file apple.py
save apple 1-3, 5

# create a bookmar for a dir
bookmark site /usr/lib/python2.6/site-packages/

# dir history
dhist

# time to execute
timeit method()

# run in background
bg go()

# check the job
jobs[0].status

# check the result
jobs[0].result

# help
jobs?

# run script
run script
run -p script # profile
run -d script # debug
