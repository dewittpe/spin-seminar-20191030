#'
#' Standard markup: this is the
#' text of the deliverable, the
#' human readable stuff.
#'
#+ label = "chunk1"
# r-code

#'Inline code evaluation: The
#'average weight the cars in the
#'mtcars data set is 
{{ mean(mtcars[["wt"]]) * 1000}}
#'pounds.

# /* comments:
# anything in the
# c-sytle comments will not be
# transfered to the .R(md|nw) file.
# */
