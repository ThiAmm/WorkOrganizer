#' Combines a list of projectLists to a taskList
#' @param a list of taskLists
#' @param a list of corresponding projectNames
#' @examples
#' projectA.tasks <- getTaskList("tests/testthat/Data/tasksForProjectA.csv")
#' projectB.tasks <- getTaskList("tests/testthat/Data/tasksForProjectB.csv")
#' combineProjectLists(list(projectA.tasks,projectB.tasks),c("Project A","Project B"))
combineProjectLists <- function(projectLists, projectNames) {
  library(dplyr)
  library(purrr)

  taskLists <- map2(projectLists,projectNames,function(projectList, projectName){projectList %>% mutate(projectId = projectName)})
  bind_rows(taskLists)
}
