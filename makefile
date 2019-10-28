CRAN = 'https://cran.rstudio.com'

ifeq ($(shell which nvim), /usr/local/bin/nvim)
	VIM ?= $(shell which nvim)
else
	ifeq ($(shell which vim), /usr/bin/vim)
		VIM ?= $(shell which vim)
  else
	$(error "neigther neovim or vim are available")
endif
endif

all : .pkgs slides.html

.pkgs :
	R --quiet --vanilla -e "options(repos = $(CRAN))"\
		-e "if (!('devtools' %in% rownames(installed.packages()))) {install.packages('devtools')}"\
		-e "devtools::install_cran('rmarkdown')"\
		-e "devtools::install_cran('ggplot2')"\
		-e "devtools::install_cran('dplyr')"\
		-e "devtools::install_cran('qwraps2')"\
		-e "devtools::install_cran('nycflights13')"\
		-e "devtools::install_bioc('BiocStyle')"
	touch .pkgs

slides.Rmd : slides.R
	R --quiet --vanilla -e "knitr::spin('$<', knit = FALSE)"

slides.html : slides.Rmd style.css 00-flights.Rmd.html 00-flights.html 01-flights.R.html 01-flights.Rmd.html syntax.R.html syntax.Rmd.html syntax.Rnw.html 03-conditional.R.html
	$(MAKE) -C 02-flights
	R --quiet --vanilla -e "rmarkdown::render('$<')"

00-flights.Rmd.html : 00-flights.Rmd
	$(VIM) --version
	$(VIM) -c TOhtml -c wqa $<

00-flights.html : 00-flights.Rmd
	R --quiet --vanilla -e "rmarkdown::render('$<')"

01-flights.R.html : 01-flights.R
	$(VIM) -c TOhtml -c wqa $<

01-flights.Rmd : 01-flights.R
	R --quiet --vanilla -e "knitr::spin('$<', knit = FALSE)"

01-flights.Rmd.html : 01-flights.Rmd
	$(VIM) -c TOhtml -c wqa $<

syntax.R.html : syntax.R
	$(VIM) -c TOhtml -c wqa $<

syntax.Rnw.html : syntax.Rnw
	$(VIM) -c TOhtml -c wqa $<

syntax.Rmd.html : syntax.Rmd
	$(VIM) -c TOhtml -c wqa $<

03-conditional.R.html : 03-conditional.R
	$(VIM) -c TOhtml -c wqa $<

clean :
	/bin/rm .pkgs
	/bin/rm *.html
