#' Add a new task to a \code{taskList}
#' @param taskId the taskId (short and meaningful)
#' @param taskCreator the name of the creator of the task
#' @param taskDescription a description of the task to do
#' @param taskDateCreated the date on which the task is created
#' @param taskDeadline the date on which the task has to be finished
#' @param taskDateFinished the date on which the task was finished
#' @examples
#' getTaskList() %>% addTask("FirstTask",taskId = "SecondName-FirstName",taskDateCreated = "2017-06-06")
addTask <-
  function(taskList,
           taskId,
           taskCreator = NULL ,
           taskDescription = NULL ,
           taskDateCreated = NULL ,
           taskDeadline = NULL,
           taskDateFinished = NULL,
           projectId = NULL,
           expectedOverallWorkTimeInHours = NULL,
           timeWorkedOnTaskInHours.BySections = NULL
           ) {
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
        },
        taskDateFinished = if (is.null(taskDateFinished)) {
          NA
        } else{
          as.Date(taskDateFinished)
        },
        projectId = if (is.null(projectId)) {
          NA
        } else{
          projectId
        },
        expectedOverallWorkTimeInHours = if (is.null(expectedOverallWorkTimeInHours)) {
          NA
        } else{
          expectedOverallWorkTimeInHours
        },
        timeWorkedOnTaskInHours.BySections = if (is.null(timeWorkedOnTaskInHours.BySections)) {
          NA
        } else{
          timeWorkedOnTaskInHours.BySections
        }
      )
      bind_rows(taskList, newTask)
    }
  }
