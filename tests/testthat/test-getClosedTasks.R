context("open and closed tasks")

test_that("extracting open tasks from a task list", {
  library(dplyr)
  openTasks <-
    getTaskList() %>% addTask(
      "SomeTask",
      "Ammon-Thilo",
      "New task",
      taskDateCreated = "2018-10-14",
      taskDeadline = "2018-10-19"
    ) %>% addTask(
      "SomeTask",
      "Ammon-Thilo",
      "New task",
      taskDateCreated = "2018-10-14",
      taskDeadline = "2018-10-19"
    ) %>% getOpenTasks()
  expect_equal(nrow(openTasks), 1)
})
