# merge two or more PDFs into a new PDF
pdftk 1.pdf 2.pdf 3.pdf cat output 123.pdf

# or
pdftk A=1.pdf B=2.pdf cat A B output 12.pdf

# or
pdftk *.pdf cat output combined.pdf

# split select pages from multiple PDFs into a new PDF
pdftk A=one.pdf B=two.pdf cat A1-7 B1-5 A8 output combined.pdf

# rotate the first page of a PDF 90 degrees clockwise
pdftk in.pdf cat 1E 2-end output out.pdf

# rotate entire PDF 180 degrees
pdftk in.pdf cat 1-endS output out.pdf

# encrypt a PDF using 128-Bit strength and withhold all permissions
pdftk mydoc.pdf output mydoc.128.pdf owner_pw foopass

# same as above, except a password is required to open the PDF
pdftk mydoc.pdf output mydoc.128.pdf owner_pw foo user_pw baz

# same as above, except printing is allowed (after the PDF is open)
pdftk mydoc.pdf output mydoc.128.pdf owner_pw foo user_pw baz allow printing

# decrypt a PDF
pdftk secured.pdf input_pw foopass output unsecured.pdf

# join two Files, one of which is encrypted (the output is not encrypted)
pdftk A=secured.pdf mydoc.pdf input_pw A=foopass cat output combined.pdf

# uncompress PDF page streams for editing the PDF code in a text editor
pdftk mydoc.pdf output mydoc.clear.pdf uncompress

# repair a PDF's corrupted XREF table and stream lengths
pdftk broken.pdf output fixed.pdf

# burst a single PDF document into single pages and report its data to doc_data.txt
pdftk mydoc.pdf burst

# report on PDF document metadata, bookmarks and page labels
pdftk mydoc.pdf dump_data output report.txt

# Remove security limitations from PDF
gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=OUTPUT.pdf -c .setpdfwrite -f INPUT.pdf

