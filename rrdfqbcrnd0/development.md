# Developing

Here are the commands I use for developing. The
[ggplot2 development](http://cran.r-project.org/web/packages/ggplot2/vignettes/development.html)
webpage also provides suggestions for development strategies.

TIP: To single step line by line use ESS in emacs. For starting directory for R process in emacs use the same directory as this file.

TIP: To single step line by line use rstudio 

TIP: In Rstudio I open README.md (this file) and execute code lines one by one.

```r
library(knitr)
library(devtools)
devtools::load_all()

## If documentation provided by files in R directory have changed
devtools::document()
## Build the vignettes
devtools::build_vignettes()
## Run the test
devtools::test()
## Check if the package is valid
devtools::check()
## Install the package
devtools::install()
## 
```

## Commands used for developing

Creating vignettes
##################

The command below creates the vignette my-vignette.Rmd.

```
devtools::use_vignette("my-vignette")
```
 
Setup test directories
######################

The command below creates the test directories for the testhat environment.

```
devtools::use_testthat() 
```
 
Setup data-raw directory
########################

The command below creates the data-raw directories for the reproducing the datasets environment.

```
devtools::use_data_raw() 
```

In a script to actually add a foo use:
```
devtools::use_data(foo) 
```
 
## Makefile in root directory

The makefile in the root directory is used for keeping track of the tasks to do before releasing the package. It would make sense to split the file into several makefiles going into the applicable subdirectories - that will be done when it is agreed on how to do it.

# Highlightning in knitr

https://gist.github.com/yihui/3114112

Options for highlight engine
http://www.andre-simon.de/doku/highlight/en/highlight.php

Polyglot in knit
https://raw.githubusercontent.com/yihui/knitr-examples/master/106-polyglot.Rmd

R-markdown
http://rmarkdown.rstudio.com/html_document_format.html#html-fragments

Example 
https://gist.github.com/yihui/3422133

% http://stackoverflow.com/questions/21660673/styling-r-output-with-knitr
% http://tex.stackexchange.com/questions/100088/r-code-linebreaks-and-code-highlighting-in-knitr
% https://github.com/yihui/knitr/blob/master/inst/examples/knitr-listings.Rnw
% http://tex.stackexchange.com/questions/14927/listing-syntax-highlighting-for-sparql-query
% https://github.com/yihui/knitr/blob/master/inst/examples/knitr-themes.Rnw
% https://github.com/yihui/knitr-examples/blob/master/098-highlight-python.Rnw
% https://www.overleaf.com/latex/examples/syntax-highlighting-in-latex-with-the-listings-package/jxnppmxxvsvk
% https://www.sharelatex.com/learn/Code_Highlighting_with_minted#Reference_guide
% http://www.andre-simon.de/

Here is a skeleton for getting output highlighted.

This show how to call the highlight engine.
```{r sp1, engine='highlight', engine.opts='-l -S n3 --inline-css -O md'}
select * where {?s ?p ?o}
```

To make this work in markdown two blanks has to be added at the end of line according to markdown syntax.
```{r mksp1}
forsparqlprefix<- GetForSparqlPrefix( "$myQbName" )
sparql.rq<- GetAttributesSparqlQuery( forsparqlprefix )
fn<- file.path(tempdir(), "sp1.rq" )
cat( "## @knitr sp1", gsub("\\n", "  \n", sparql.rq), sep="  \n", file=fn)
knitr::read_chunk( fn, from=c(1))
readLines(fn)
```

```{r sp1, asis=TRUE, engine='highlight', engine.opts='-l -S n3 --inline-css -O md'}
```

The (http://www.andre-simon.de/doku/highlight/en/highlight.php)[highlight] package can take a input file and output it many formats with the code highlighted. Below is one-liner example showing highlighting of a short SPARQL query as html. The option --inline-css embeds the CSS in the html file. If the option is not present, the CSS is written to file highlight.css and reffered to in the generated html. The second line opens the file in the default browser.
```
echo -e "prefix a: <bb.bb>\\nselect * where {?s ?p ?o}" | highlight --inline-css -S n3 > highlight-simple-example.html
xdg-open highlight-simple-example.html
```

```{r engine='bash'}
echo -e "prefix a: <bb.bb>\\nselect * where {?s ?p ?o}" | highlight --inline-css -S n3
```
