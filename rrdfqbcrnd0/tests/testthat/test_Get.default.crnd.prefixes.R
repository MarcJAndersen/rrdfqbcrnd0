##' Test code for Get.default.crnd.prefixes function
##' @author Ippei Akiya

library(testthat)

context("Test for DC-DM-sample.TTL file")
expect_equal(env[["qbCDISCprefixes"]], Get.default.crnd.prefixes())

