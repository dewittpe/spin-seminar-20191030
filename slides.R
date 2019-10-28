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
#'     * .Rnw --> .tex --> .pdf
#'     * .Rmd --> .(md|tex) --> .(html|pdf|docx)
#'
#' * These workflows are very good and should be used as much as possible.
#'
#'     1. Write a document in a markup language, e.g., LaTeX, markdown, ...
#'     2. Weave into the markup language an analysis language, e.g., R
#'     3. Create a deliverable dynamic and reproducible report
#'
#' * Simple Example: 00-flights.Rmd to 00-flights.html
#'
#' ##
#'
#+ eval = FALSE
rmarkdown::render(input = "00-flights.Rmd", output_format = "html_document")

#'
#' <div class="box">
#' <iframe src="00-flights.Rmd.html" style="height:500px;"></iframe>
#' </div>
#' <div class="box">
#' <iframe class="example" src="00-flights.html" style="height:500px;"></iframe>
#' </div>
#'
#' <div class='notes'>
#'
#' Notes: There are several things you need to highlight in this example
#'
#' 1. The include = FALSE option for some of the chunks.
#' 1. The inline code.
#' 1. The table.
#'
#' </div>
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
#' * Can you re-use the code? Can you source a .Rmd file?
#'```{r, error = TRUE}
#'source("00-flights.Rmd")
#'```
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
#' ##
#'
#+ label = 'spin-flights', eval = FALSE
knitr::spin(hair = "01-flights.R", knit = FALSE)
# [1] "01-flights.Rmd"
rmarkdown::render(input = "01-flights.Rmd", output_format = "html_document")

#'
#' <div class="box">
#' <iframe src="01-flights.R.html" style="height:445px;"></iframe>
#' </div>
#' <div class="box">
#' <iframe src="01-flights.Rmd.html" style="height:445px;"></iframe>
#' </div>
#'
#' ## Syntax
#'
#' <div class="box3">
#' .Rmd
#' <iframe src="syntax.Rmd.html" style="height:425px;"></iframe>
#' </div>
#' <div class="box3">
#' .Rnw
#' <iframe src="syntax.Rnw.html" style="height:425px;"></iframe>
#' </div>
#' <div class="box3">
#' .R
#' <iframe src="syntax.R.html" style="height:425px;"></iframe>
#' </div>
#'
#' ## knitr::spin | Benefits
#'
#' * R scripts!
#'     * Can be sourced by other scripts
#'     * Reuse your code!
#'
#' * Multiple types of comments:
#'     * Standard R comments
#'     * Commented blocks omitted from resulting .R(md|nw|html|.+)
#'
#' * My opinion:
#'     * easier development work to write a .R than a .Rmd
#'     * .Rmd is a redo of the original work done in "sandbox" files such as
#'     "eda.R" and "initial-analysis.R"
#'
#' # knitr::spin -- Part II:  A Full Document
#'
#' ## A full report in a .R file
#'
#' * YAML Headers can be used.
#'
#' * Just define the build process you want.
#'
#' * Example 02-flights-with-yaml.R to .html and .docx
#'
#' ## The .R file
#' <iframe src="02-flights/02-flights-with-yaml.R.html" style="height:400px;"></iframe>
#'
#+ eval = FALSE
# /*
try(
# */
knitr::spin(hair = "02-flights.R", knit = FALSE)
# [1] "02-flights.Rmd"
rmarkdown::render(input = "02-flights.Rmd", output_format = "all")
# /*
, silent = TRUE)
# */
#'
#' ## The .html
#'
#' <iframe src="02-flights/02-flights-with-yaml.html"></iframe>
#'
#' ## The .docx
#'
#' <div class="box">
#' <img src="02-flights/02-flights-with-yaml-0.png" width=100%></img>
#' </div>
#' <div class="box">
#' <img src="02-flights/02-flights-with-yaml-1.png" width=100%></img>
#' </div>
#'
#' # knitr::spin -- Part III: Advanced Use
#'
#' ## knitr::spin | Child Documents
#'
#' Let's walk through an example
#'
#' ## knitr::spin | Conditional Evaluation
#'
#' * You have one .R file.  It will be evaluated in two ways:
#'     1. As an R script in working directory A
#'     2. Spun to .Rmd and the Rmd will be evalauted as package vignette, or
#'     other document, evaluated from wroking directory B.
#'
#' * Specific example: Building an R package "<pkg.name>"
#'     1. The R script evaluates as a script in the data-raw directory
#'     2. Spun to .Rmd for building a vignette
#'
#' What does the following do?
#'
#' ## knitr::spin | Conditional Evaluation
#'
#' <iframe src="03-conditional.R.html" style="height:200px;"></iframe>
#'
#' # Thank you
#'
#' * You are welcome to contact me with questions
#'      * <peter.dewitt@cuanschutz.edu>
#'
#' * Slides and examples from this talk are available at
#'      * https://github.com/dewittpe/spin-seminar-20191030
#'
#' * <img width=150px style="padding: 0 15px; float: right;" src="drug-hex.jpeg"></img>
#' Want to meet other R Users from academics and industry?
#' Come to a Denver R Users Group Meetup.
#'      * https://www.meetup.com/DenverRUG/
#'
# /* end of file */
