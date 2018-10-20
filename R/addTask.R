#' Add a new task to a \code{taskList}
#' @param taskId the taskId
#' @param taskCreator the name of the creator of the task
#' @param taskDescription a description of the task to do
#' @param taskDateCreated the date on which the task is created
#' @param taskDeadline the date on which the task has to be finished
addTask <-
  function(taskList,
           taskId,
           taskCreator = NULL ,
           taskDescription = NULL ,
           taskDateCreated = NULL ,
           taskDeadline = NULL) {
    library(dplyr)
    if (taskId %in% (taskList %>% pull(taskId))) {
      warning("taskId already taken. Please choose another taskId")
      return(taskList)
    } else{
      newTask <-  tibble(
        taskId = as.character(taskId),
        taskCreator = if (is.null(taskCreator)) {
          NA
        } else{
          taskCreator
        },
        taskDescription = if (is.null(taskDescription)) {
          NA
        } else{
          taskDescription
        },
        taskDateCreated = if (is.null(taskDateCreated)) {
          NA
        } else{
          as.Date(taskDateCreated)
        },
        taskDeadline = if (is.null(taskDeadline)) {
          NA
        } else{
          as.Date(taskDeadline)
        }
      )
      bind_rows(taskList, newTask)
    }
  }
