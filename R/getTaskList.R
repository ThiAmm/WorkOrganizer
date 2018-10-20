getTaskList <- function(path = NULL) {
  library(tibble)
  library(dplyr)
  library(readr)

  if (is.null(path)) {
    tibble(
      taskId = character(),
      taskCreator = character(),
      taskDescription = character(),
      taskDateCreated = character(),
      taskDeadline = character(),
      taskDateFinished = character(),
      projectId = character()
    ) %>% mutate(taskDateCreated = as.Date(taskDateCreated)) %>% mutate(taskDeadline = as.Date(taskDeadline)) %>% mutate(taskDateFinished = as.Date(taskDateFinished))
  } else{
    read_delim(
      path,
      delim = ";",
      col_names = TRUE,
      col_types = cols()
    )
  }
}
