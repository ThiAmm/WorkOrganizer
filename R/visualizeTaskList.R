#' Prints all your task on a timeline
#' @param taskList a list of all tasks
#' @examples
#' taskList <- getTaskList(path = "tests/testthat/Data/tasks.csv")
#' visualizeTaskList(taskList)
visualizeTaskList <- function(taskList) {
  library(timevis)
  projectIds <- taskList %>% pull(projectId) %>% unique()
  groups <- tibble(id = projectIds, content = projectIds)
  timevis(
    taskList %>% rename(
      start = taskDateCreated,
      end = taskDeadline,
      content = taskId,
      group = projectId
    ),
    groups = groups
  )
}
