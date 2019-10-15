CRAN = 'https://cran.rstudio.com'

all : .pkgs slides.html

.pkgs : 
	R --vanilla -e "options(repos = $(CRAN))"\
		-e "if (!('devtools' %in% rownames(installed.packages()))) {install.packages('devtools')}"\
		-e "devtools::install_cran('rmarkdown')"\
		-e "devtools::install_cran('ggplot2')"\
		-e "devtools::install_cran('dplyr')"\
		-e "devtools::install_cran('qwraps2')"\
		-e "devtools::install_cran('nycflights13')"
	touch .pkgs
	
slides.html : slides.R 00-flights.Rmd.html 00-flights.html
	R --vanilla -e "knitr::spin('$<', knit = FALSE)"\
		-e "rmarkdown::render('$(basename $<).Rmd')"


00-flights.Rmd.html : 00-flights.Rmd
	vim -c TOhtml -c wqa $<

00-flights.html : 00-flights.Rmd
	R --vanilla -e "rmarkdown::render('$<')"

clean :
	/bin/rm .pkgs
	/bin/rm *.html
