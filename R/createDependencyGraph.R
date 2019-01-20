createDependencyGraph <- function(taskList) {
  library(visNetwork)
  library(purrr)

  nodes <- taskList %>% rename(label = taskId,
                      group = projectId) %>% mutate(id = label)

  edges <- pmap(taskList %>% select(taskId, dependsOn), function(taskId, dependsOn) {
    tibble(
      to = taskId,
      from = splitBracketCharacter(dependsOn)
    )
  }) %>% bind_rows()
  visNetwork(nodes, edges, width = "100%") %>% visEdges(arrows = 'from')
}
