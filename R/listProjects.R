#' List all file names in a specified \code{path} which match a certain \code{fileNamePattern}
listProjects <-
  function(fileNamePattern,
           path = getwd(),
           full.names = FALSE) {
    unique(sapply(fileNamePattern, function(fileNamePattern) {
      print(path)
      list.files(
        path = path,
        pattern = paste0("*", fileNamePattern, "*.csv"),
        recursive = TRUE,
        full.names = full.names
      )
    }))
  }
