##' Test code for BuildCubeFromWorkbook function
##' @author Ippei Akiya


## Write test code below
library(testthat)
library(xlsx)


wbFilePath <- system.file("extdata", "sample-cfg",
                          "RDFCubeWorkbook.xlsx",
                          package="rrdfqbcrnd0")


## Check the Number of Sheets
wbSheets <- getSheets(loadWorkbook(wbFilePath))
test_that("Check the Number of Sheets in RDFCubeWorkbook.xlsx", {
  expect_equal(length(wbSheets), 6)
})


## Test for DEMO-Components Sheet
wb01 <- read.xlsx(wbFilePath, 1, stringsAsFactors=FALSE)
test_that("check the number of rows and columns in DEMO-Components Sheet", {
  expect_equal(ncol(wb01), 6)
  expect_equal(nrow(wb01), 27)
})

test_that("check the values in DEMO-Components", {
  expect_equal(wb01$compType[7], "dimension")
  expect_equal(wb01$compName[7], "agegr1")
  expect_equal(wb01$codeType[7], "DATA")
  expect_equal(is.na(wb01$nciDomainValue[7]), TRUE)
  expect_equal(wb01$compLabel[7], "Age group")
  expect_equal(is.na(wb01$Comment[7]), TRUE)
  
  expect_equal(wb01$compType[16], "metadata")
  expect_equal(wb01$compName[16], "dataCubeFileName")
  expect_equal(is.na(wb01$codeType[16]), TRUE)
  expect_equal(is.na(wb01$nciDomainValue[16]), TRUE)
  expect_equal(wb01$compLabel[16], "DC-DEMO-R-V")
  expect_equal(wb01$Comment[16], "Cube name prefix (will be appended with version number by script. --> No. Will be set in code based on domainName parameter")
    				
})


## Test for DM-Components Sheet
wb03 <- read.xlsx(wbFilePath, 3, stringsAsFactors=FALSE)
test_that("check the number of rows and columns in DEMO-Components Sheet", {
  expect_equal(ncol(wb03), 6)
  expect_equal(nrow(wb03), 23)
})

test_that("check the values in DEMO-Components", {
  expect_equal(wb03$compType[6], "dimension")
  expect_equal(wb03$compName[6], "race")
  expect_equal(wb03$codeType[6], "SDTM")
  expect_equal(wb03$nciDomainValue[6], "C74457")
  expect_equal(wb03$compLabel[6], "Race")
  expect_equal(is.na(wb03$Comment[6]), TRUE)
  
  expect_equal(wb03$compType[22], "metadata")
  expect_equal(wb03$compName[22], "obsFileNameDirectory")
  expect_equal(is.na(wb03$codeType[22]), TRUE)
  expect_equal(is.na(wb03$nciDomainValue[22]), TRUE)
  expect_equal(wb03$compLabel[22], "!example")
  expect_equal(wb03$Comment[22], "The directory containd the wasDerivedFrom file")
  
})




## Test for CubePrefixes Sheet
wb06 <- read.xlsx(wbFilePath, 6, stringsAsFactors=FALSE)
test_that("check the number of rows and columns in CubePrefixed Sheet", {
  expect_equal(ncol(wb06), 2)
  expect_equal(nrow(wb06), 14)
})

test_that("check the values in CubePrefixed Sheet", {
  expect_equal(wb06$prefix[4], "dct")
  expect_equal(wb06$prefix[9], "qb")
  expect_equal(wb06$namespace[4], "http://purl.org/dc/terms/")
  expect_equal(wb06$namespace[9], "http://purl.org/linked-data/cube#")
})



