
# WorkOrganizer

To add a task, simply do

```
taskList <-
    getTaskList() %>% addTask(
      "SomeTask",
      "Name-FirstName",
      "The task to carry out",
      taskDateCreated = "2018-10-14",
      taskDeadline = "2018-10-19"
    )
```

You can also visualize all of your tasks with the following command
```
visualizeTaskList(taskList)
```
This yields the following visualization of your tasks
![taskVisualized](inst/img/tasksVisualized.png "fig:")
