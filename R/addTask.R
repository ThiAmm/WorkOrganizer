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
