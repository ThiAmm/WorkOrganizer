context("creating tasklists from list of project-tasks")

test_that("combineProjectLists works",{
  library(here)
  projectA.tasks <- getTaskList(file.path(here::here(),"tests/testthat/Data/tasksForProjectA.csv"))
  projectB.tasks <- getTaskList(file.path(here::here(),"tests/testthat/Data/tasksForProjectB.csv"))
  combinedProjectList <- combineProjectLists(list(projectA.tasks,projectB.tasks),c("Project A","Project B"))
  expect_equal(numberOfTasks(combinedProjectList),2)
  expect_equal(combinedProjectList %>% pull(projectId),c("Project A","Project B"))
})
