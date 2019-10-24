#'
#' Standard markup: this is the
#' text of the deliverable, the
#' human readable stuff.
#'
#+ label = "chunk1"
fit <- lm(mpg ~ wt, data = mtcars)

#'Inline code evaluation: The
#'average weight the cars in the
#'mtcars data set is
{{ mean(mtcars[["wt"]]) * 1000}}
#'pounds. The expected mpg for the
#'cars in the mtcar data set
#'decreases by
{{ abs(coef(fit)[1]) }}
#'miles per gallon for every
#'additional 1,000 lbs of
#'weight.

# /* comments:
# anything in the
# c-sytle comments will not be
# transfered to the .R(md|nw) file.
# */
