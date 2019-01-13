checkTaskList <- function(taskList) {
  unsupportedCharactersInTaskId <- c(",", "[", "]")
  !sapply(unsupportedCharactersInTaskId, function(unsupportedCharacterInTaskId) {
    grepl(paste0("\\",unsupportedCharacterInTaskId), taskList %>% pull(taskId)) %>% any()
  }) %>% any()
}
