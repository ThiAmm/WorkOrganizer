context("test-listprojectnames.R")
library(here)

test_that("List project names in folders", {

  expect_equal(listProjects("task",file.path(here::here(),"tests/testthat/Data/")), 4)
})
