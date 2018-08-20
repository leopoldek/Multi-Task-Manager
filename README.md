# Multi Task Manager

![Task Image](https://i.imgur.com/1ljsYN3.png)

This addon allows you to perform a series of tasks in parallel. Furthermore, if the task's input relies on the output of another task, it will stall until all inputs are ready. This allows you to quickly perform sequences of sub-tasks to accomplish a one big task.

## How to Use
Download the asset and place the folder in the addons folder in the addons folder in your project.

### How to create a Task Graph
In the inspector, click on the button at the top left of the panel to open the new resource dialog. In the search bar type "TaskGraphData". Once that is done, you can open the panel at the bottom and start creating a graph!
> Note: To save the graph, you MUST click save in the top-left of the panel.

### How to run the Task Manager
Make sure a task graph was given to the manager, then fill all the neccesary inputs and call `start()`. If an input isn't given a value, it will be `null`.

You can get the outputs using signals. Use `finished` if you want to know when all outputs have been set. If you want to get outputs one at a time, use `output_ready`.
> I may change `finished` to when all *tasks* are finished in a future update.
