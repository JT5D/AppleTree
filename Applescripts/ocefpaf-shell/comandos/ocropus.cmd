# optimize images
ocropus book2pages out images*

# extract lines
ocropus pages2lines out

# OCR lines
ocropus lines2fsts out

# consolidate text
ocropus fsts2text out

# make book
ocropus buildhtml out > book.html
