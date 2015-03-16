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

