all : 02-flights-with-yaml.html 02-flights-with-yaml.docx 02-flights-with-yaml.R.html

02-flights-with-yaml.Rmd : 02-flights-with-yaml.R
	R --quiet --vanilla -e "knitr::spin('$<', knit = FALSE)"

02-flights-with-yaml.R.html : 02-flights-with-yaml.R
	$(VIM) -c TOhtml -c wqa $<

02-flights-with-yaml.html 02-flights-with-yaml.docx : 02-flights-with-yaml.Rmd template.docx
	R --quiet --vanilla -e "rmarkdown::render('$<', output_format = 'all')"

