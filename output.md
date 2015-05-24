This is a demo file for pandoc-crossref. With this filter, you can
cross-reference figures (see figs. 1-3), display equations (see eq. 1)
and tables (see tbl. 1)

There is also support for code blocks, for example, lsts. 1-3

Chapter 1. Figures
==================

![Figure \# 1: First figure](img1.jpg)

![Figure \# 2: Second figure](img2.jpg)

![Figure \# 3: Third figure](img3.jpg)

![Unlabelled image](img1.jpg)

Chapter 2. Equations
====================

$$ P_i(x) = \sum_i a_i x^i \qquad(1)$$

Chapter 3. Tables
=================

  First Header   Second Header
  -------------- ---------------
  Content Cell   Content Cell
  Content Cell   Content Cell

  : *Table 1*: Table example

Table without caption:

  First Header   Second Header
  -------------- ---------------
  Content Cell   Content Cell
  Content Cell   Content Cell

Chapter 4. Code blocks
======================

There are a couple options for code block labels. Those work only if
code block id starts with `lst:`, e.g. `{#lst:label}`

`caption` attribute
-------------------

`caption` attribute will be treated as code block caption. If code block
has both id and `caption` attributes, it will be treated as numbered
code block.

<div id="lst:captionAttr" class="listing haskell">

Listing 1: Listing caption

``` {.haskell}
main :: IO ()
main = putStrLn "Hello World!"
```

</div>

\pagebreak

Table-style captions
--------------------

Enabled with `codeBlockCaptions` metadata option. If code block is
immediately adjacent to paragraph, starting with `Listing:` or `:`, said
paragraph will be treated as code block caption.

<div id="lst:tableCaption" class="listing haskell">

Listing 2: Listing caption

``` {.haskell}
main :: IO ()
main = putStrLn "Hello World!"
```

</div>

Wrapping div
------------

Wrapping code block without label in a div with id `lst:...` and class,
starting with `listing`, and adding paragraph before code block, but
inside div, will treat said paragraph as code block caption.

<div id="lst:wrappingDiv" class="listing haskell">

Listing 3: Listing caption

``` {.haskell}
main :: IO ()
main = putStrLn "Hello World!"
```

</div>

Chapter 5. Reference lists
==========================

It's also possible to show lists of figures and tables, like this:

List of Figures
---------------

1.  First figure
2.  Second figure
3.  Third figure

List of Tables
--------------

1.  Table example

List of Listings
================

1.  Listing caption
2.  Listing caption
3.  Listing caption

