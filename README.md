# Multi Task Manager

![Task Image](https://i.imgur.com/1ljsYN3.png)

This addon allows you to perform a series of tasks in parallel. Furthermore, if the task's input relies on the output of another task, it will stall until all inputs are ready. This allows you to quickly perform sequences of sub-tasks to accomplish a one big task.

## How to Use
Download the asset and place the folder in the addons folder in the addons folder in your project.

### How to Create a Task Graph
In the inspector, click on the button at the top left of the panel to open the new resource dialog. In the search bar type "TaskGraphData". Once that is done, you can open the panel at the bottom and start creating a graph!
> Note: To save the graph, you MUST click save in the top-left of the panel.

### How to Run the Task Manager
Make sure a task graph was given to the manager, then fill all the neccesary inputs and call `start()`. If an input isn't given a value, it will be `null`.

You can get the outputs using signals. Use `finished` if you want to know when all outputs have been set. If you want to get outputs one at a time, use `output_ready`.
> I may change `finished` to when all *tasks* are finished in a future update.

### How to create a task
A task is just a script (can be any script language that supports static functions) that has 3 critical functions: `_run()`, `_inputs()` and `_outputs()`. `_run` is called when the task is to be executed. Put all logic in there. To give the task inputs, add member variables to the script and in `_inputs()` return a list of all the inputs by their name. As such:
```
var input1
var input2

static func _inputs():
    return ["input1", "input2"]
```
The same can be done for outputs:
```
var output1
var output2

static func _outputs():
    return ["output1", "output2"]
```
All together it looks like:
```
# task.gd
# This task produces two outputs:
# One is the addition of the two inputs and the other is the difference.

var input1
var input2

var output1
var output2

func _run():
    output1 = input1 + input2
    output2 = input1 - input2

static func _inputs():
    return ["input1", "input2"]

static func _outputs():
    return ["output1", "output2"]
```
### Progress Polling
You can get the progression of the manager by calling `TaskManager.get_progress()`. This will return a float between 0 and 1. Normally this will tell you how many tasks have been completed but if you want finer-tuned progress polling you can override the progress for a certain task. To do so, add two new variables called `total_progress` and `progress`. `total_progress` should stay static during execution and should contain the maximum amount of progress required to complete the task. `progress` contains the amount of progress completed within the task. Using the previous example, this would look like:
```
[...omitted...]

var progress = 0
var total_progress = 2

func _run():
    output1 = input1 + input2
    progess += 1
    output2 = input1 - input2
    progress += 1

[...omitted...]
```
