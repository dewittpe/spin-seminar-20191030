all : slides.html

slides.html : slides.R
	R --vanilla -e "knitr::spin('$<', knit = FALSE)"\
		-e "rmarkdown::render('$(basename $<).Rmd')"

