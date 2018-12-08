getOpenTasks <- function(taskList){
  taskList %>% filter_at(vars("taskDateFinished"),all_vars(is.na(.)))
}
