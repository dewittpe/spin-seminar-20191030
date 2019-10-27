#' # Tables
#'
#' **Table 1**
#'
#+ results = "asis"
qs <- qwraps2::qsummary(diamonds)
qs$x <- qs$y <- qs$z <- qs$depth <- qs$table <- qs$carat <- qs$carat2 <- NULL

whole <- qwraps2::summary_table(diamonds, summaries = qs)
grped <- qwraps2::summary_table(dplyr::group_by(diamonds, carat2), summaries = qs)
cbind(whole, grped)
