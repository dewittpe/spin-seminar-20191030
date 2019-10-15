#'---
#'title: "knitr::spin -- A more dynamic approach to dynamic documents"
#'subtitle: "Department of Biostatistics & Informatics Seminar"
#'author: "Peter E. DeWitt, Ph.D.<br>Research Associate<br>Department of Pedicatrics<br><peter.dewitt@cuanschutz.edu>"
#'date: 30 October 2019
#'output:
#'  ioslides_presentation:
#'    keep_md: false
#'    widescreen: true
#'    self_contained: true
#'---
# /*
# other yaml things
#    template: template.html
#    css: style.css
# */
#'
#+ label = "setup", include = FALSE
knitr::opts_chunk$set(collapse = TRUE)

#'
#' # knitr::spin -- Part I: The Basics
#'
#' ## Dynamic Documents
#'
#' * Common Workflows:
#'   * .Rnw --> .tex --> .pdf
#'   * .Rmd --> .(md|tex) --> .(html|pdf|docx)
#'
#' * These workflows are very good and should be used as much as possible.
#'
#'   1. Write a document in a markup language, e.g., LaTeX, markdown, ...
#'   2. Weave into the markup language an analysis language, e.g., R
#'   3. Create a deliverable dynamic and reproducible report
#'
#' * Simple Example: 00-flights.Rmd to 00-flights.html
#'
#' ## Let's think about the paradigm
#'
#' * Analysis language is weaved *into* a markup language
#'
#' * The markup language is the *primary* language for the file
#'
#' * I am a coder:
#'
#'   * My primary language is the analysis language
#'   * The markup language is for extremely detailed comments.
#'
#' * What happens if you tried: `source("00-fligths.Rmd")`?
#'
#' ## knitr::spin - Reverse the paradigm
#'
#' * `knitr::spin`
#'
#'   * R is the primary language
#'   * A markup language is the guest language
#'
#' * Example: 01-flights.R
#'
#' * Workflow:  .R --> .Rmd --> .md --> .html
#'
#' ## knitr::spin | Benefits over knitr::knit
#'
#' * R scripts!  These can be sourced by other scripts
#'
#' * Multiple types of comments:
#'   * Standard R comments
#'   * Commented blocks omitted from resulting .Rmd
#'
#' * My opinion:
#'   * easier development work to write a .R than and .Rmd
#'   * .Rmd is a redo of the original work done in through-away files such as
#'   "eda.R" and "initial-analysis.R"
#'
#' # knitr::spin -- Part II:  A Full Document
#'
#' ## A full report in a .R file
#'
#' * YAML Headers can be used.
#'
#' * Just define the build process you want.
#'
#' * Example 02-flights-with-yaml.R
#'
#' # knitr::spin -- Part III: An Advanced Use
#'
#' ## knitr::spin | Conditional Evaluation
#'
#' * Build a R package with example data sets.
#'   * data sets are build in the `data-raw` directory
#'   * Provide details on the construction of the data set in a package vignette
#'
#' * knitr::spin, and little hacking, *with one file*, will let you:
#'
#'   1. Build the data set and R documentation in the data-raw directory
#'   dynamically.
#'   2. Build a vignette for the end user to reference.
#'
#' ## knitr::spin | Conditional Evaluation
#'
#' * This example relies of softlinks
#'   * Mac and Linux users you're cool.
#'   * Windows users.... this will require a little effort
#'
#' * This example will illustrate conditional evaluation of code.
#'
#'
#' # Thank you
#'
#' * Slides and examples from this talk are available at
#' https://github.com/dewittpe/drug-20190423
#'
#' * ASA COWY Meeting on Friday the 26th
#'
#' * Future Speakers and Topics?
#'
# /* end of file */
