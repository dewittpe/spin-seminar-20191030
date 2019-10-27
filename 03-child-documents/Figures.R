#' # Figures
#'
#' **Figure 01**
#'
#+ label = "Figure01"
ggplot2::ggplot(diamonds) +
ggplot2::aes(x = carat, y = price) +
ggplot2::geom_point() +
ggplot2::xlab("Carat Weight") +
ggplot2::ylab("Price (US Dollars)")

#'
#' **Figure 02**
#'
#+ label = "Figure02"
ggplot2::ggplot(diamonds) +
ggplot2::aes(x = carat2, y = price) +
ggplot2::geom_violin() +
ggplot2::stat_summary(fun.y = mean, geom = "point") +
ggplot2::xlab("Carat Weight") +
ggplot2::ylab("Price (US Dollars)")

#'
#' **Figure 03**
#'
#+ label = "Figure03"
plot_tukey_data <- as.data.frame(tukey[[1]])
plot_tukey_data$rn <- rownames(plot_tukey_data)
rownames(plot_tukey_data) <- NULL

ggplot2::ggplot(plot_tukey_data) +
ggplot2::aes(y = rn, x = diff, xmin = lwr, xmax = upr) +
ggplot2::geom_point() +
ggplot2::geom_errorbarh() +
ggplot2::geom_vline(xintercept = 0, linetype = 4) +
ggplot2::ylab("Carat Weight Groups") +
ggplot2::xlab("Difference in mean Price between levels of Carat weights")

