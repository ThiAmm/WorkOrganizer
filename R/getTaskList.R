getTaskList <- function() {
  library(tibble)

  taskList <- tibble(
    taskId = character(),
    taskCreator = character(),
    taskDescription = character(),
    taskDateCreated = character(),
    taskDeadline = character()
  ) %>% mutate(taskDateCreated = as.Date(taskDateCreated)) %>% mutate(taskDeadline = as.Date(taskDeadline))
}
