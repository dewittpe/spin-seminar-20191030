RFILES = $(wildcard R/*.R)

00-parent.docx : $(RFILES)
	R --vanilla --quiet -e "knitr::spin('00-parent.R', knit = FALSE)"\
		-e "rmarkdown::render('00-parent.Rmd')"
