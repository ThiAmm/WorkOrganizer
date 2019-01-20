timeWorkedOnTasks <- function(taskList){
  taskList %>% mutate(timeWorkedOnTaskInHours = sum(as.numeric(splitBracketCharacter(timeWorkedOnTaskInHours.BySections))))
}
