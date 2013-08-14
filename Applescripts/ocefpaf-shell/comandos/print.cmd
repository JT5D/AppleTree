# simplest form
cat thesis.txt > /dev/lp

# view queue
lpq

# cancel all
lprm -

# cancel specific
lptm 31

# example
lp -d ${printer} -o sides=two-sided-long-edge -o media=Tray1 ${doc}
