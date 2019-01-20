addWorkTimeForTask <- function(taskList, taskId, workTimeInHours) {
  library(stringr)
  taskList <- taskList %>% mutate(
    timeWorkedOnTaskInHours.BySections = if_else(
      taskId == !!taskId,
      str_replace(
        timeWorkedOnTaskInHours.BySections,
        "]",
        paste0(",", workTimeInHours, "]")
      ),
      timeWorkedOnTaskInHours.BySections
    )
  )
  if("timeWorkedOnTaskInHours" %in% colnames(taskList)){
    taskList <- timeWorkedOnTasks(taskList)
  }
  taskList
}
