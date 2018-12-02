context("test-listprojectnames.R")
library(here)

test_that("List project names in folders", {
  library(here)
  projectPaths <- listProjects("task",file.path(here::here(),"tests/testthat/Data/"))
  expect_true(grepl("tasksForProjectA",listProjects("task",file.path(here::here(),"tests/testthat/Data/"))) %>% any())
})
