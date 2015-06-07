##' Test code for encodetouri function
##' @author Ippei Akiya

library(testthat)

context("Test for encodetouri")
expect_equal(encodetouri('http://rdf.cdisc.org/std/adam-2-1#Model.ADaM-2-1'), 'http://rdf.cdisc.org/std/adam-2-1#Model.ADaM-2-1')
expect_equal(encodetouri('http://rdf.cdisc.org/std/adam-2-1#Model.ADaM-2-1>'), 'http://rdf.cdisc.org/std/adam-2-1#Model.ADaM-2-1_')
