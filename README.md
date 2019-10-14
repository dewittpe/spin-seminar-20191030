# knitr::spin -- A more dynamic approach to dynamic documents

**Department of Biostatistics and Informatics Seminar 30 October 2019**

Building dynamic documents via literate programming is a critical part of
responsible and reproducible science.

Authoring a dynamic document uses a markup language (markdown, LaTeX, html, ...)
as the primary language and "weaves" or "knits" an analysis/programming language
(R, python, C++, SAS, ...) as the secondary language.  This paradigm has been
extremely useful and durable since its formal introduction in the book "Literate
Programming" Donald Knuth in 1984. R users should be at least aware of Sweave
and knitr::knit, two R focused literate programming tools.

From the point of view of a data analyst the common paradigm is backwards.  The
analysis language is the primary language and the markup language is used for
robust comments about the analysis.  For the R language, use of the knitr::spin
and proper formatting of a .R file will allow an analysis to turn any data
analysis script into a dynamic document.

This talk will cover the following:

1. Introduction to knitr::spin -- concept and syntax
2. Simple reports -- that is analysis.R --> analysis.(docx|html|pdf)
3. Non-trivial reports -- child documents and conditional code evaluation

