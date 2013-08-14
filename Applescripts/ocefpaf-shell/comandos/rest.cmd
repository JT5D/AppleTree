# Restructured text

# Headings
Heading 1   Heading 2   Heading 3   Heading 4   Heading 5
=========   ---------   ~~~~~~~~~   """""""""   '''''''''

# Basic Inline Markup

Inline *emphasis*
Inline **bold**
Inline ``literal`` fixed font

# Tables
Grid table:

+------------+------------+-----------+
| Header 1   | Header 2   | Header 3  |
+============+============+===========+
| body row 1 | column 2   | column 3  |
+------------+------------+-----------+
| body row 2 | Cells may span columns.|
+------------+------------+-----------+
| body row 3 | Cells may  | - Cells   |
+------------+ span rows. | - contain |
| body row 4 |            | - blocks. |
+------------+------------+-----------+

Simple table:

=====  =====  ======
   Inputs     Output
------------  ------
  A      B    A or B
=====  =====  ======
False  False  False
True   False  True
False  True   True
True   True   True
=====  =====  ======

# Bullets and Numbering

The following shows a nested set of bulleted and numbered lists.

- A bullet item, which can span lines, but which will get wrapped when it is
  rendered.

- A second bullet.

  - Nested items work as well. You **must** have blank line before the item in
    a nested list.
  - But, often you do not need extra blank lines. DocUtils is pretty good at
    figuring out what you mean.

1. You can provide numbered lists.
2. Using

   a. The normal

      i.  Set of numbering
      ii. Schemes.
      #.  Using a hash if you get bored with counting yourself.
      #.  And you can nest

          - Bulleted lists and numbered lists
          - Pretty much as you would expect.


Some Definitions
----------------

reStructureText
    A powerful markup text markup language, but which is nevertheless
    remarkably lightweight in most circumstances. Its lightweight nature makes
    it very well suited to embedded code and API documentation; the markup was
    designed to be as unobtrusive as possible [#]_. 

Docutils
    The project that defined reStructureText and provides the definitive set
    of tools for processing reStructureText into various output formats.

Epydoc
    A Python API documentation extraction tool, which can use reStructureText
    as its markup syntax.


Some Field Lists
----------------

:Meat: Tinned Spam
:Version: 0.2
:Dedication:
    To all the climate scientists around the World who continually strive to
    alert us about the dangers of climate change.


.. [#] Often, reStructureText looks little different from text as you would
       normally type it in, for example, a `README` file.
