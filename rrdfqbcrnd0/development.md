# Developing

Here are the commands I use for developing. The
[ggplot2 development](http://cran.r-project.org/web/packages/ggplot2/vignettes/development.html)
webpage also provides suggestions for development strategies.

TIP: To single step line by line use ESS in emacs

TIP: To single step line by line use rstudio 

TIP: In Rstudio I open README.md (this file) and execute code lines one by one.

```r
library(knitr)
library(devtools)
devtools::load_all()
devtools::document()
devtools::test()
devtools::check()
devtools::install()
devtools::build_vignettes()
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

Here is a skeleton for getting output highlighted.

This show how to call the highlight engine.
```{r sp1, engine='highlight', engine.opts='-l -S n3 --inline-css -O md'}
select * where {?s ?p ?o}
```

This code make a temporary file sp2.rq with knitr chunk name sp2.
The file is then made available as a chunk for knitr. Finally the contents of the file is printed.
```{r mksp1}
fn<- file.path(tempdir(), "sp2.rq" )
rq<- "select * where {?subject ?property ?object}"
cat( "## @knitr sp2", rq, sep="\n", file=fn)
knitr::read_chunk( fn, from=c(1))
cat(readLines(fn))
```

The following code includes the chunk.
```{r sp2, engine='highlight', engine.opts='-l -S n3 --inline-css -O md'}
```

highlight -S n3 test.rq 

