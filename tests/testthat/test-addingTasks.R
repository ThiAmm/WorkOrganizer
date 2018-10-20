context("adding tasks")

test_that("adding tasks works", {
  library(dplyr)
  taskList <-
    getTaskList() %>% addTask(
      "SomeTask",
      "Ammon-Thilo",
      "New task",
      taskDateCreated = "2018-10-14",
      taskDeadline = "2018-10-19"
    )

  expect_equal(nrow(taskList), 1)
})

test_that("adding two tasks with the same taskId does not work", {
  library(dplyr)
  taskList <-
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
    )
  expect_equal(nrow(taskList), 1)
})
