CRAN = 'https://cran.rstudio.com'

all : .pkgs slides.html

.pkgs :
	R --quiet --vanilla -e "options(repos = $(CRAN))"\
		-e "if (!('devtools' %in% rownames(installed.packages()))) {install.packages('devtools')}"\
		-e "devtools::install_cran('rmarkdown')"\
		-e "devtools::install_cran('ggplot2')"\
		-e "devtools::install_cran('dplyr')"\
		-e "devtools::install_cran('qwraps2')"\
		-e "devtools::install_cran('nycflights13')"
	touch .pkgs

slides.Rmd : slides.R
	R --quiet --vanilla -e "knitr::spin('$<', knit = FALSE)"

slides.html : slides.Rmd style.css 00-flights.Rmd.html 00-flights.html 01-flights.R.html 01-flights.Rmd.html syntax.R.html syntax.Rmd.html syntax.Rnw.html
	R --quiet --vanilla -e "rmarkdown::render('$<')"

00-flights.Rmd.html : 00-flights.Rmd
	nvim --version
	nvim -c TOhtml -c wqa $<

00-flights.html : 00-flights.Rmd
	R --quiet --vanilla -e "rmarkdown::render('$<')"

01-flights.R.html : 01-flights.R
	nvim -c TOhtml -c wqa $<

01-flights.Rmd : 01-flights.R
	R --quiet --vanilla -e "knitr::spin('$<', knit = FALSE)"

01-flights.Rmd.html : 01-flights.Rmd
	nvim -c TOhtml -c wqa $<

syntax.R.html : syntax.R
	nvim -c TOhtml -c wqa $<

syntax.Rnw.html : syntax.Rnw
	nvim -c TOhtml -c wqa $<

syntax.Rmd.html : syntax.Rmd
	nvim -c TOhtml -c wqa $<

clean :
	/bin/rm .pkgs
	/bin/rm *.html
