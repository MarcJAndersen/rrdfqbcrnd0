##' Test code for capitalize function
##' @author Ippei Akiya

library(testthat)

## Write test code below

test_that("check the values in DEMO-Components", {
  expect_equal(capitalize("string and text", strict = TRUE), "STRING AND TEXT")
  expect_equal(capitalize("string and text", strict = FALSE), "String And Text")
})

