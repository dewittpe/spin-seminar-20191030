#'---
#'title: "knitr::spin -- A more dynamic approach to dynamic documents"
#'subtitle: "Department of Biostatistics & Informatics Seminar"
#'author: "Peter E. DeWitt, Ph.D.<br>Research Associate<br>Department of Pedicatrics<br><peter.dewitt@cuanschutz.edu>"
#'date: 30 October 2019
#'output:
#'  ioslides_presentation:
#'    keep_md: false
#'    widescreen: true
#'    css: style.css
#'    self_contained: true
#'---
# /*
# other yaml things
#    template: template.html
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
#'     1. Write a document in a markup language, e.g., LaTeX, markdown, ...
#'     2. Weave into the markup language an analysis language, e.g., R
#'     3. Create a deliverable dynamic and reproducible report
#'
#' * Simple Example: 00-flights.Rmd to 00-flights.html
#'
#' ## Input: 00-flights.Rmd &#8594; Output: 00-flights.html
#'
#' <div class="box">
#' <iframe class="example" src="00-flights.Rmd.html"></iframe>
#' </div>
#' <div class="box">
#' <iframe class="example" src="00-flights.html"></iframe>
#' </div>
#'
#'
#' ## Let's think about the paradigm
#'
#' * Dynamic Document:
#'     * Implicit documentation, limit transcription errors, ...
#'     * The **_markup language_** is the **_primary_** language for the file
#'     * The analysis language is weaved *into* a markup language
#'
#' * I am a data analyst:
#'
#'     * The **_analysis language_** is my **_primary_** language
#'     * The markup language is for extremely detailed comments
#'
#' * What happens if you try: `source("00-fligths.Rmd")`?
print(try(source("00-flights.Rmd"), silent = TRUE))

#'
#' ## knitr::spin - Reverse the paradigm
#'
#' * `knitr::spin` <br> https://yihui.name/knitr/demo/stitch/
#'
#'     * R is the primary language
#'     * A markup language is the guest language
#'
#' * Workflow:  .R &#8594; .Rmd &#8594; .md &#8594; .html <br> <br>
#' That is,
#'
#'     1. *spin* .R to .R(md|nw),
#'     2. *knit* to .(md|tex),
#'     3. and then build .(docx|html|pdf) via pandoc
#'
#' * Example: 01-flights.R
#'
#' ## 01-flights.R &#8594; 01-flights.Rmd
#+ label = 'spin-flights'
knitr::spin(hair = "01-flights.R", knit = FALSE)

#'
#' ## 01-flights.R &#8594; 01-flights.Rmd
#'
#' <div class="box">
#' <iframe class="example" src="01-flights.R.html"></iframe>
#' </div>
#' <div class="box">
#' <iframe class="example" src="01-flights.Rmd.html"></iframe>
#' </div>
#'
#' ## knitr::spin | Syntax
#'
#' | .Rmd | .Rnw | .R |
#' |:-----|:-----|:---|
#' |The markup language | The markup language | #' The markup language |
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
#' https://github.com/dewittpe/spin-seminar-20191030
#'
#' * <img width=150px style="padding: 0 15px; float: left;" src="drug-hex.jpeg"></img>
#' Want to meet other R Users from academics and industry?
#' Come to a Denver R Users Group Meetup.  https://www.meetup.com/DenverRUG/
#'
# /* end of file */
