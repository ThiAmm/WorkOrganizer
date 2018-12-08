#' Read project lists from a file path and combines them to a taskList
#' @param pathToProjectLists a list of paths to project related task lists
#' @examples
#' projectA.tasks.Path <- "tests/testthat/Data/tasksForProjectA.csv"
#' projectB.tasks.Path <- "tests/testthat/Data/tasksForProjectB.csv"
#' combineProjectLists.FromPathToProjectLists(list(projectA.tasks.Path,projectB.tasks.Path))

combineProjectLists.FromPathToProjectLists <- function(pathToProjectLists){
  projectTaskLists <- lapply(pathToProjectLists,function(pathToProjectList){
    getTaskList(pathToProjectList)
  })
  combineProjectLists(projectTaskLists,pathToProjectLists)
}
