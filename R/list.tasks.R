list.tasks <- function(pathToProjectFile) {
  library(readr)
  read_delim(pathToProjectFile,delim = ";", col_names = TRUE, col_types = cols())
}
