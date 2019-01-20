context("work time on tasks")

test_that("work time calculation is correct", {
  library(dplyr)
  taskList <-
    getTaskList() %>% addTask(
      "SomeTask",
      "Ammon-Thilo",
      "New task",
      taskDateCreated = "2018-10-14",
      taskDeadline = "2018-10-19",
      expectedOverallWorkTimeInHours = 5,
      timeWorkedOnTaskInHours.BySections = "[2.4,0.5,0.2]"
    )
  taskList <- timeWorkedOnTasks(taskList)
  expect_equal(taskList %>% filter(taskId == "SomeTask") %>% pull(timeWorkedOnTaskInHours), 3.1)
})

test_that("add worked time in hours", {
  library(dplyr)
  taskList <-
    getTaskList() %>% addTask(
      "SomeTask",
      "Ammon-Thilo",
      "New task",
      taskDateCreated = "2018-10-14",
      taskDeadline = "2018-10-19",
      expectedOverallWorkTimeInHours = 5,
      timeWorkedOnTaskInHours.BySections = "[2.4,0.5,0.2]"
    )
  taskList <- taskList %>% addWorkTimeForTask("SomeTask",1.4)
  expect_equal(taskList %>% filter(taskId == "SomeTask") %>% pull(timeWorkedOnTaskInHours.BySections), "[2.4,0.5,0.2,1.4]")
})

test_that("updating timeWorkedOnTaskInHours works correctly when adding worked time in hours", {
  library(dplyr)
  taskList <-
    getTaskList() %>% addTask(
      "SomeTask",
      "Ammon-Thilo",
      "New task",
      taskDateCreated = "2018-10-14",
      taskDeadline = "2018-10-19",
      expectedOverallWorkTimeInHours = 5,
      timeWorkedOnTaskInHours.BySections = "[2.4,0.5,0.2]"
    )
  taskList <- timeWorkedOnTasks(taskList) %>% addWorkTimeForTask("SomeTask",1.4)
  expect_equal(taskList %>% filter(taskId == "SomeTask") %>% pull(timeWorkedOnTaskInHours), 4.5)
})

