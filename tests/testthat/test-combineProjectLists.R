context("creating tasklists from list of project-tasks")

test_that("combineProjectLists works",{
  library(here)
  projectA.tasks <- getTaskList(file.path(here::here(),"tests/testthat/Data/tasksForProjectA.csv"))
  projectB.tasks <- getTaskList(file.path(here::here(),"tests/testthat/Data/tasksForProjectB.csv"))
  combinedProjectList <- combineProjectLists(list(projectA.tasks,projectB.tasks),c("Project A","Project B"))
  expect_equal(numberOfTasks(combinedProjectList),5)
  expect_equal(combinedProjectList %>% pull(projectId) %>% unique(),c("Project A","Project B") )
})
