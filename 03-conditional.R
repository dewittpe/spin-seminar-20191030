#+ label = "define_input_data_file_path"
# /*
if (grepl("<pkg.name>/data-raw$", normalizePath(getwd()))) {
input_data_file_path <- "../inst/extdata/input_data.csv"
} else {
# */
input_data_file_path <- system.file("extdata", "input_data.csv", package = "<pkg.name>")
# /*
}
# */


# as an R script
input_data_file_path <- "../inst/extdata/input_data.csv"


# as a R chunk in an .Rmd file:
```{r label = "define_input_data_file_path"}
input_data_file_path <- system.file("extdata", "input_data.csv", package = "<pkg.name>")
```

