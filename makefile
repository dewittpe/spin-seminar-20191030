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

slides.html : slides.Rmd 00-flights.Rmd.html 00-flights.html 01-flights.R
	R --quiet --vanilla -e "rmarkdown::render('$<')"

00-flights.Rmd.html : 00-flights.Rmd
	nvim --version
	nvim -c TOhtml -c wqa $<

00-flights.html : 00-flights.Rmd
	R --quiet --vanilla -e "rmarkdown::render('$<')"

clean :
	/bin/rm .pkgs
	/bin/rm *.html
