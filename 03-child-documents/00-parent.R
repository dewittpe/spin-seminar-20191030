#'---
#'title: "Important Research Paper"
#'author: Clinician One, The Statistician, Clinician Two, Senior Author
#'output: rmarkdown::word_document
#'---
#'
#+ label = "setup", include = FALSE
library(ggplot2)
theme_set(theme_bw())
options(qwraps2_markup = "markdown")
knitr::opts_chunk$set(echo = FALSE, results = "hide")

#+ label = "load_data", include = FALSE
orig <- new.env()
data(diamonds, package = "ggplot2", envir = orig)
data(diamonds, package = "ggplot2", envir = .GlobalEnv)
diamonds <- subset(diamonds, carat <= 3)

# check
dim(orig$diamonds)
dim(diamonds)

# discretized carat weights
diamonds$carat2  <- droplevels(cut(diamonds$carat, breaks = seq(0, 3, by = 0.5)))
table(diamonds$carat2, useNA = "always")

#'
#'
#+ label = "get_results_for_absract"
invisible(source("03-Results.R"))

#'
#' # Abstract
#'
#' **Purpose:** Building up a clinical research article in parts is one way to
#' organize an your work.  Some writers may find having several small files,
#' each with a specific focus, easier to work with than one all encompassing
#' large file.  The files presented in this directory are and example of
#' building a clinical research manuscript with knitr::spin and child documents.
#'
#' **Methods:** Example files and a work flow are presented.  A subset of the
#' diamonds data set from the ggplot2 is used for the examples.
#'
#' **Results:** _hightlight results here, e.g.  Diamonds ranging between 1.0 and 1.5
#' carats in weight have a mean price of
{{ cis[["carat2(1,1.5]"]] }}
#' US dollars._
#'
#' **Conclusions:** _hightlight conclusions_
#'
# /* Spin the Introduction section */
{{ knitr::spin_child("01-Introduction.R") }}
# /* Spin the Methods section */
{{ knitr::spin_child("02-Methods.R") }}
# /* Spin the Results section */
{{ knitr::spin_child("03-Results.R") }}
# /* Spin the Discussion section */
{{ knitr::spin_child("04-Discussion.R") }}
#'
#' # References
#'
#' <div id="refs"></div>
#'
#' # Table Captions
#'
#' **Table 1:** Summary of the diamonds data set.
#'
#' # Figure Captions
#'
#' **Figure 1:** The diamonds data set: Scatter plot of price by carat weight.
#'
#' **Figure 2:** The diamonds data set: Price by carat weight.  Mean price for
#' each set of diamonds is plotted as a point on the violin plot.
#'
#' **Figure 3:** Tukey HSD for differeces in mean price of diamonds by carat
#' weight groups.
#'
{{knitr::spin_child("Tables.R")}}
{{knitr::spin_child("Figures.R")}}

