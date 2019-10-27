#' # Results
#'
#' The original diamonds data set provides the sale price of
{{qwraps2::frmt(nrow(diamonds))}}
#' diamonds along with several specific physical characteristics of the diamond.
#' This data set included carat weights ranging from
{{ min(orig$diamonds$carat) }}
#' carats to
{{ max(orig$diamonds$carat) }}
#' carats.  For the work presented here we restricted the data to diamonds with
#' a maximum weight of three carats.  A scatter plot of the data set indicates
#' that carat weights tend to be reported in whole or half integer values. Due
#' to this, we have elected to discretized the report carat weight in half carat
#' intervals.  See **Table 1** for an overall summary of this data set.
#'
#' ## Price by carat weight
#'
#+ label = "price_by_weight"
fit <- lm(price ~ carat2 + 0, data = diamonds)
cis <- qwraps2::frmtci(cbind(coef(fit), confint(fit)), show_level = TRUE)
#'
#' The mean price for a diamond increases with carat size, as expected.
#' Starting with a mean price of
{{cis[["carat2(0,0.5]"]]}}
#' for diamonds with a maximum weight of 0.5 carats, the largest mean price is
{{cis[["carat2(2.5,3]"]]}}
#' for 2.5 to 3.0 carat weight diamonds.
#'
#+ label = 'tukey'
tukey <- TukeyHSD(aov(fit))
tukey

#'
#' The mean price of the diamonds is statistically different between each group
#' of carat weights.  This conclusion is based on all pairwise comparisons and
#' accounting for multiple comparisons via Tukey's Honest Significant
#' Difference; see **Figure 3**.
#'
