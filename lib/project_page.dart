import 'package:flutter/material.dart';
import 'globals.dart';
import 'progress_bar.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  void eraseProject(inputsAddLater) {}

  TextEditingController _textEditingController = TextEditingController();

  addProject() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Text("Name your project:"),
              ],
            ),
            content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //We first add the name of the project to the project list
                  projects.add(_textEditingController.text);
                  //We then add a 0 to projectOwnsRoadmarks
                  projectOwnsRoadmarks.add(1);
                  roadmarks.add("Placeholder roadmark");
                  roadmarkOwnsTasks.add(1);
                  tasks.add("Placeholder task");
                  taskStatus.add(false);

                  setState(() {});

                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  addRoadmark(projectIndex, previousRoadmarks) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Text("Insert new roadmark name:"),
              ],
            ),
            content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //We insert the new roadmark in the list of roadmarks at the correct index
                  roadmarks.insert(
                      previousRoadmarks + projectOwnsRoadmarks[projectIndex],
                      _textEditingController.text);
                  //We add a 0 in the correct place in roadmarkOwnsTasks
                  roadmarkOwnsTasks.insert(
                      previousRoadmarks + projectOwnsRoadmarks[projectIndex],
                      0);
                  ////We increment the corresponding projectOwnsRoadmarks
                  projectOwnsRoadmarks[projectIndex]++;
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  addTask(projectIndex, previousTasks, roadmarkIndex, tasksInRoadmark,
      previousRoadmarks) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          int tasksBeforeRoadmark;
          print(previousTasks);
          if (roadmarkIndex == 0) {
            tasksBeforeRoadmark = 0;
          } else {
            tasksBeforeRoadmark = tasks
                .sublist(
                    previousTasks,
                    previousTasks +
                        roadmarkOwnsTasks
                            .sublist(previousRoadmarks,
                                previousRoadmarks + roadmarkIndex)
                            .reduce((value, element) => value + element))
                .length;
          }
          if (projectIndex != 0) {
            //tasksBeforeRoadmark++;
          }

          return AlertDialog(
            title: Row(
              children: [
                Text("Insert new task name:"),
              ],
            ),
            content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //We insert the new task in the list of tasks at the correct index
                  tasks.insert(
                      previousTasks +
                          tasksBeforeRoadmark +
                          tasksInRoadmark.length,
                      _textEditingController.text);
                  print("Adding task:");
                  print(_textEditingController.text);
                  print("To:");
                  print(roadmarks[roadmarkIndex]);
                  print("At index:");
                  print(previousTasks +
                      tasksBeforeRoadmark +
                      tasksInRoadmark.length);
                  print(previousTasks);
                  print(tasksBeforeRoadmark);
                  print(tasksInRoadmark.length);
                  print("===============");
                  //We add a false status at that same index
                  taskStatus.insert(
                      previousTasks +
                          tasksBeforeRoadmark +
                          tasksInRoadmark.length,
                      false);
                  //We modify the corresponding roadmarkOwnsTasks
                  roadmarkOwnsTasks[previousRoadmarks + roadmarkIndex]++;

                  setState(() {});
                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  deleteRoadmark(int projectIndex, String roadmarkToDelete, int startIndex) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Text("Delete this roadmark and the tasks within?"),
                Text(" "),
                Text(roadmarkToDelete)
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //First we find the index of the roadmark
                  int roadmarkIndex = 0;
                  for (var i = 0;
                      i <
                          roadmarks
                              .sublist(
                                  startIndex,
                                  startIndex +
                                      projectOwnsRoadmarks[projectIndex])
                              .length;
                      i++) {
                    if (roadmarks.sublist(
                            startIndex,
                            startIndex +
                                projectOwnsRoadmarks[projectIndex])[i] ==
                        roadmarkToDelete) {
                      roadmarkIndex = startIndex + i;
                    }
                  }
                  //We then delete its tasks
                  //Start by getting the amount of tasks that come before the ones belonging to this roadmark
                  int tasksBefore = 0;
                  if (roadmarkIndex != 0) {
                    tasksBefore = roadmarkOwnsTasks
                        .sublist(0, roadmarkIndex)
                        .reduce((value, element) => value + element);
                  }
                  //Now we delete the tasks in the roadmark and their bool status
                  tasks.removeRange(tasksBefore,
                      tasksBefore + roadmarkOwnsTasks[roadmarkIndex]);
                  taskStatus.removeRange(tasksBefore,
                      tasksBefore + roadmarkOwnsTasks[roadmarkIndex]);
                  //Now we remove the ROT item
                  roadmarkOwnsTasks.removeAt(roadmarkIndex);
                  //Now we remove the roadmark itself
                  roadmarks.removeAt(roadmarkIndex);
                  //Now we decrement the corresponding POR item
                  projectOwnsRoadmarks[projectIndex] =
                      projectOwnsRoadmarks[projectIndex] - 1;
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  editRoadmark(int projectIndex, String roadmarkToEdit, int startIndex) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(children: [
              Text('Rename roadmark '),
              Text(roadmarkToEdit),
              Text(' to:')
            ]),
            content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'New name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //First we find the index of the roadmark
                  int roadmarkIndex = 0;
                  for (var i = 0;
                      i <
                          roadmarks
                              .sublist(
                                  startIndex,
                                  startIndex +
                                      projectOwnsRoadmarks[projectIndex])
                              .length;
                      i++) {
                    if (roadmarks.sublist(
                            startIndex,
                            startIndex +
                                projectOwnsRoadmarks[projectIndex])[i] ==
                        roadmarkToEdit) {
                      roadmarkIndex = startIndex + i;
                    }
                  }
                  //Now we change it's name
                  roadmarks[roadmarkIndex] = _textEditingController.text;
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  deleteTask(int previousTasks, List tasksInProject, List<int> projectROT,
      int roadmarkIndex, String taskToDelete) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Text("Delete this task?"),
                Text(" "),
                Text(taskToDelete)
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //First we get the index of the task
                  //To do this, we start by getting it's local index (i.e: it's index in tasksInProject)
                  //We first define a variable that represents the previous tasks in the project (the ones before the roadmark that conmtains the target)
                  int previousTasksInProject;
                  if (roadmarkIndex == 0) {
                    previousTasksInProject = 0;
                  } else {
                    previousTasksInProject = projectROT
                        .sublist(0, roadmarkIndex)
                        .reduce((value, element) => value + element);
                  }
                  //Now that we have the previous tasks defined, we implement a loop that checks the sublist of tasks that represents the current roadmark.
                  int targetIndex = 0;
                  for (var i = 0; i < projectROT[roadmarkIndex]; i++) {
                    if (tasksInProject.sublist(
                            previousTasksInProject,
                            previousTasksInProject +
                                projectROT[roadmarkIndex])[i] ==
                        taskToDelete) {
                      targetIndex = i + previousTasksInProject;
                      //targetIndex is the index of the target task
                    }
                  }
                  //We now have the index of the task
                  //We delete the coresponding item in tasks and taskStatus
                  tasks.removeAt(targetIndex);
                  taskStatus.removeAt(targetIndex);
                  //Now we must decrement the ROT number corresponding to the roadmark to which the task belongs by 1
                  roadmarkOwnsTasks[roadmarkIndex]--;
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  editTask(int previousTasks, List tasksInProject, List<int> projectROT,
      int roadmarkIndex, String taskToEdit) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(children: [
              Text('Rename task '),
              Text(taskToEdit),
              Text(' to:')
            ]),
            content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'New name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //First we get the index of the task
                  //To do this, we start by getting it's local index (i.e: it's index in tasksInProject)
                  //We first define a variable that represents the previous tasks in the project (the ones before the roadmark that conmtains the target)
                  int previousTasksInProject;
                  if (roadmarkIndex == 0) {
                    previousTasksInProject = 0;
                  } else {
                    previousTasksInProject = projectROT
                        .sublist(0, roadmarkIndex)
                        .reduce((value, element) => value + element);
                  }
                  //Now that we have the previous tasks defined, we implement a loop that checks the sublist of tasks that represents the current roadmark.
                  int targetIndex = 0;
                  for (var i = 0; i < projectROT[roadmarkIndex]; i++) {
                    if (tasksInProject.sublist(
                            previousTasksInProject,
                            previousTasksInProject +
                                projectROT[roadmarkIndex])[i] ==
                        taskToEdit) {
                      targetIndex = i + previousTasksInProject + previousTasks;
                      //targetIndex is the index of the target task
                    }
                  }
                  //We now have the index of the task, we can modify it
                  setState(() {
                    tasks[targetIndex] = _textEditingController.text;
                  });

                  print(tasks[targetIndex]);

                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  deleteProject(
      BuildContext context,
      int projectIndex,
      int previousRoadmarks,
      int previousTasks,
      List<String> roadmarkList,
      int roadmarkListStartIndex,
      List<String> taskList,
      List<int> listROT,
      List<String> tasksInProject,
      List<int> projectROT) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text("Delete this project?"),
              Text(" "),
              Text(projects[projectIndex])
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                //We are going to delete the project, it's roadmarks and their tasks
                //We start with the tasks and taskStatus
                tasks.removeRange(
                    previousTasks, previousTasks + tasksInProject.length);
                taskStatus.removeRange(
                    previousTasks, previousTasks + tasksInProject.length);

                //Now the roadmarks and their task ownership registry
                if (projectIndex == 0) {
                  roadmarks.removeRange(0, roadmarkList.length);
                  roadmarkOwnsTasks.removeRange(0, roadmarkList.length);
                } else {
                  roadmarks.removeRange(projectOwnsRoadmarks[projectIndex],
                      projectOwnsRoadmarks[projectIndex] + roadmarkList.length);
                  roadmarkOwnsTasks.removeRange(
                      projectOwnsRoadmarks[projectIndex],
                      projectOwnsRoadmarks[projectIndex] + roadmarkList.length);
                }
                //Now the project and it's ownership detail
                projectOwnsRoadmarks.removeAt(projectIndex);
                projects.removeAt(projectIndex);

                Navigator.pop(context);
                setState(() {});
              },
              child: Text("Confirm"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            )
          ],
        );
      },
    ).then((result) {
      // Handle the result of the dialog
      if (result != null) {}
    });
  }

  editProject(
    BuildContext context,
    int projectIndex,
    int previousRoadmarks,
    int previousTasks,
    List<String> roadmarkList,
    int roadmarkListStartIndex,
    List<String> taskList,
    List<int> listROT,
    List<String> tasksInProject,
    List<int> projectROT,
  ) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          String textToDisplay;
          textToDisplay = "Edit project";

          return Dialog(
              backgroundColor: containerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.all(7.5),
                  child: Column(
                    children: [
                      Text(textToDisplay, style: titleText),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: constraints.maxHeight * heightMultiplier,
                            child: ListView.builder(
                              shrinkWrap: false,
                              itemCount: roadmarkList.length + 1,
                              itemBuilder: (context, index) {
                                int previousTasksInTaskList = 0;
                                if (index == 0 ||
                                    index == roadmarkList.length) {
                                  previousTasksInTaskList = 0;
                                } else if (index < roadmarkList.length) {
                                  previousTasksInTaskList = listROT
                                      .sublist(0, index)
                                      .reduce(
                                          (value, element) => value + element);
                                }

                                int tasksCurrent = 0;
                                /* if (index != 0) {
                                  tasksCurrent = listROT[index - 1];
                                } */
                                int currentRoadmarkIndex = 0;
                                if (index != roadmarkList.length) {
                                  currentRoadmarkIndex = index;
                                }

                                List<String> tasksInRoadmark = taskList.sublist(
                                    previousTasksInTaskList,
                                    previousTasksInTaskList +
                                        listROT[currentRoadmarkIndex]);

                                if (index < roadmarkList.length) {
                                  return ListTile(
                                      tileColor: containerColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      title: Row(children: [
                                        Text(
                                          roadmarkList[index],
                                          style: subTitleText,
                                        ),
                                        Spacer(),
                                        PopupMenuButton<String>(
                                          tooltip: '', // or tooltip: null,
                                          onSelected: (value) {
                                            if (value == 'Delete') {
                                              Navigator.of(context).pop();
                                              deleteRoadmark(
                                                  projectIndex,
                                                  roadmarkList[index],
                                                  roadmarkListStartIndex);
                                            } else {
                                              Navigator.of(context).pop();
                                              editRoadmark(
                                                  projectIndex,
                                                  roadmarkList[index],
                                                  roadmarkListStartIndex);
                                            }
                                          },
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: Colors.black,
                                          ),
                                          itemBuilder: (BuildContext context) {
                                            return <PopupMenuEntry<String>>[
                                              PopupMenuItem<String>(
                                                value: 'Edit',
                                                child: Text('Rename'),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'Delete',
                                                child: Text('Delete'),
                                              ),
                                            ];
                                          },
                                        ),
                                      ]),
                                      textColor: Colors.black,
                                      subtitle: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: listROT[index] + 1,
                                            itemBuilder: (context, index) {
                                              if (index <
                                                  tasksInRoadmark.length) {
                                                return ListTile(
                                                  tileColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  title: Text(
                                                    taskList[
                                                        previousTasksInTaskList +
                                                            tasksCurrent +
                                                            index],
                                                    style: defaultText,
                                                  ),
                                                  textColor: Colors.black,
                                                  trailing:
                                                      PopupMenuButton<String>(
                                                    tooltip:
                                                        '', // or tooltip: null,
                                                    onSelected: (value) {
                                                      if (value == 'Delete') {
                                                        Navigator.of(context)
                                                            .pop();
                                                        deleteTask(
                                                            previousTasks,
                                                            tasksInProject,
                                                            projectROT,
                                                            currentRoadmarkIndex,
                                                            taskList[
                                                                previousTasksInTaskList +
                                                                    index]); //I replaced tasksCurrent with index here
                                                      } else {
                                                        Navigator.of(context)
                                                            .pop();

                                                        setState(() {
                                                          editTask(
                                                              previousTasks,
                                                              tasksInProject,
                                                              projectROT,
                                                              currentRoadmarkIndex,
                                                              taskList[
                                                                  previousTasksInTaskList +
                                                                      index]);
                                                        });
                                                      }
                                                    },
                                                    icon: Icon(
                                                      Icons.more_vert,
                                                      color: Colors.black,
                                                    ),
                                                    itemBuilder:
                                                        (BuildContext context) {
                                                      return <PopupMenuEntry<
                                                          String>>[
                                                        PopupMenuItem<String>(
                                                          value: 'Edit',
                                                          child: Text('Edit'),
                                                        ),
                                                        PopupMenuItem<String>(
                                                          value: 'Delete',
                                                          child: Text('Delete'),
                                                        ),
                                                      ];
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            addTask(
                                                                projectIndex,
                                                                previousTasks,
                                                                currentRoadmarkIndex,
                                                                tasksInRoadmark,
                                                                previousRoadmarks);
                                                          });
                                                        },
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              'Add task',
                                                              style:
                                                                  redButtonText),
                                                        )));
                                              }
                                            }),
                                      ));
                                } else {
                                  return Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              setState(() {
                                                addRoadmark(projectIndex,
                                                    previousRoadmarks);
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              backgroundColor: dynamiteRed,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text('Add roadmark',
                                                  style: defaultTextWhite),
                                            )),
                                      ),
                                      Spacer(),
                                    ],
                                  );
                                }
                              },
                            ),
                          )),
                    ],
                  ),
                );
              }));
        });
  }

  renameProject(projectName) {
    //Replace the project's name with a new one
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(children: [
              Text('Rename project '),
              Text(projectName),
              Text(' to:')
            ]),
            content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'New name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //Replace the project name
                  projects[projects.indexOf(projectName)] =
                      _textEditingController.text;

                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  //previousRoadmarks is an integer that is equal to the amount of roadmarks in List roadmarks that come before the ones in the project currently being loaded
                  int previousRoadmarks = 0;
                  //previousTasks is similar to previousRoadmarks excep it applies to the List tasks
                  int previousTasks = 0;
                  //The following if statement applies only when the project being loaded is the second or above
                  if (index > 0) {
                    previousRoadmarks = projectOwnsRoadmarks
                        .sublist(0, index)
                        .reduce((value, element) => value + element);
                    previousTasks = roadmarkOwnsTasks
                        .sublist(0, previousRoadmarks)
                        .reduce((value, element) => value + element);
                  }
                  //currentTasks is tthe amount of tasks in the project
                  int currentTasks = roadmarkOwnsTasks
                      .sublist(previousRoadmarks,
                          previousRoadmarks + projectOwnsRoadmarks[index])
                      .reduce((value, element) => value + element);
                  //List tasksInProject is self explanatory
                  List<String> tasksInProject = tasks.sublist(
                      previousTasks, previousTasks + currentTasks);
                  //completedTasks is the amount of tasks in the project that are completed, this is captain obvious, signing off.
                  int completedTasksDoomed = 0;
                  //Counts the amount of roadmarks on the progress bar that are filled, it may in fact be obsolete, must investigate SOMETHING TO DO HERE!!!!!!!!!
                  int filledBalls = 0;
                  //Here we increment completedTasks for every "true" we find in the List taskStatus (which stores bools matched by their index to the tasks list)
                  for (var taskBeingChecked = 0;
                      taskBeingChecked < tasksInProject.length;
                      taskBeingChecked++) {
                    if (taskStatus[taskBeingChecked + previousTasks] == true) {
                      completedTasksDoomed++;
                    }
                  }
                  //Since compTaskDoo is doomed to be decremented after this, here i store it's initial state for later use
                  int completedTasks = completedTasksDoomed;
                  //Here we increment filledBalls by chopping bit off completedtasks based on the current roadmark's required number of tasks, the remainder is used later
                  String roadmarkInProgressName =
                      "PlaceholderStringGetsChangedInTheNextForLoop";
                  int roadmarkInProgressIndex = 0;
                  for (var roadmarkBeingChecked = 0;
                      roadmarkBeingChecked < projectOwnsRoadmarks[index];
                      roadmarkBeingChecked++) {
                    if (completedTasksDoomed >=
                        roadmarkOwnsTasks[roadmarkBeingChecked]) {
                      completedTasksDoomed -=
                          roadmarkOwnsTasks[roadmarkBeingChecked];
                      filledBalls++;
                    } else {
                      roadmarkInProgressIndex =
                          previousRoadmarks + roadmarkBeingChecked;
                      roadmarkInProgressName =
                          roadmarks[previousRoadmarks + roadmarkBeingChecked];
                      break;
                    }
                  }

                  if (roadmarkInProgressName ==
                      "PlaceholderStringGetsChangedInTheNextForLoop") {
                    roadmarkInProgressName = "All tasks Completed";
                  }
                  //currentROT is the amount of tasks in the roadmark that the previous for loop stopped at because all the tasks in it were not labelled "true"
                  int currentROT = roadmarkOwnsTasks[roadmarkInProgressIndex];
                  //OK here's the deal, the choosing of the tasks to render is spazzing out, revamp the entire part

                  //if (completedTasks == tasks) {}

                  //The following list is a list of ints representing the elements of roadmarkOwnsTasks that have been fulfilled   CHECK OBSOLESCENCE
                  List<int> completedRoadmarkTaskOwnership =
                      roadmarkOwnsTasks.sublist(0, filledBalls);

                  List<String> tasksInRoadmark = [];
                  if (completedTasks == tasksInProject.length) {
                    tasksInRoadmark.add("Project completed!");
                  } else {
                    tasksInRoadmark = tasks.sublist(
                        previousTasks /* completedTasks */ /*- completedTasksDoomed */ +
                            filledBalls,
                        previousTasks +
                            filledBalls
                            /* completedTasks */ /*-
                            completedTasksDoomed */ //Kezis
                            +
                            currentROT); //Basicall y we need a range from previousTasks (the tasks before the project) plus the number of tasks in the completed roadmarks to that plus the number of tasks in the roadmark yet to be completed
                  }
                  List<bool> isExpanded = [];
                  for (var index = 0; index < projects.length; index++) {
                    isExpanded.add(false);
                  }
                  List<int> projectROT = roadmarkOwnsTasks.sublist(
                      previousRoadmarks,
                      previousRoadmarks + projectOwnsRoadmarks[index]);
                  String currentRoadmark;
                  if (tasksInRoadmark.contains("Project completed!")) {
                    currentRoadmark = "Project completed";
                  } else {
                    currentRoadmark =
                        roadmarks[previousRoadmarks + filledBalls];
                  }

                  /* int tasksBeforeRoadmark = 0;
                  if (filledBalls > 0) {
                    tasksBeforeRoadmark = tasks.sublist(previousTasks, previousTasks + roadmarkOwnsTasks[])
                  } */
                  return Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 3, 0),
                      child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(projects[index],
                                            style: titleText),
                                      ),
                                      Spacer(),
                                      PopupMenuButton<String>(
                                        tooltip: '', // or tooltip: null,
                                        onSelected: (value) {
                                          if (value == 'Delete') {
                                            deleteProject(
                                                context,
                                                index,
                                                previousRoadmarks,
                                                previousTasks,
                                                roadmarks.sublist(
                                                    previousRoadmarks,
                                                    previousRoadmarks +
                                                        projectOwnsRoadmarks[
                                                            index]),
                                                roadmarks.indexOf(roadmarks[
                                                    previousRoadmarks]),
                                                tasksInProject,
                                                roadmarkOwnsTasks.sublist(
                                                    previousRoadmarks,
                                                    previousRoadmarks +
                                                        projectOwnsRoadmarks[
                                                            index]),
                                                tasksInProject,
                                                projectROT);
                                          } else if (value == 'Edit') {
                                            editProject(
                                                context,
                                                index,
                                                previousRoadmarks,
                                                previousTasks,
                                                roadmarks.sublist(
                                                    previousRoadmarks,
                                                    previousRoadmarks +
                                                        projectOwnsRoadmarks[
                                                            index]),
                                                roadmarks.indexOf(roadmarks[
                                                    previousRoadmarks]),
                                                tasksInProject,
                                                roadmarkOwnsTasks.sublist(
                                                    previousRoadmarks,
                                                    previousRoadmarks +
                                                        projectOwnsRoadmarks[
                                                            index]),
                                                tasksInProject,
                                                projectROT);
                                          } else if (value == 'Rename') {
                                            renameProject(projects[index]);
                                          }
                                        },
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Colors.black,
                                        ),
                                        itemBuilder: (BuildContext context) {
                                          return <PopupMenuEntry<String>>[
                                            PopupMenuItem<String>(
                                              value: 'Edit',
                                              child: Text('Edit'),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'Rename',
                                              child: Text('Rename'),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'Delete',
                                              child: Text('Delete'),
                                            ),
                                          ];
                                        },
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                      title: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              25, 20, 0, 20),
                                          child: CustomProgressBar(
                                            totalCheckpoints:
                                                tasksInProject.length,
                                            progress: completedTasks /
                                                tasksInProject.length,
                                          )),
                                      children: [
                                        Text(currentRoadmark,
                                            style: subTitleText),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: tasksInRoadmark.length,
                                          itemBuilder: (context, index) {
                                            if (tasksInRoadmark.contains(
                                                "Project completed!")) {
                                              /* return ListTile(
                                                tileColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                title: Text(
                                                  tasksInRoadmark[index],
                                                  style: defaultText,
                                                ),
                                                textColor: Colors.black,
                                              ); */
                                            } else {
                                              return ListTile(
                                                  tileColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  title: Text(
                                                    tasks[previousTasks +
                                                        completedTasks -
                                                        completedTasksDoomed +
                                                        index],
                                                    style: defaultText,
                                                  ),
                                                  textColor: Colors.black,
                                                  trailing: Checkbox(
                                                    value: taskStatus[
                                                        previousTasks +
                                                            completedTasks -
                                                            completedTasksDoomed +
                                                            index],
                                                    onChanged:
                                                        (bool? newValue) {
                                                      setState(() {
                                                        taskStatus[previousTasks +
                                                                completedTasks -
                                                                completedTasksDoomed +
                                                                index] =
                                                            newValue ?? false;
                                                      });
                                                    },
                                                    checkColor: Colors.black,
                                                    fillColor:
                                                        MaterialStateColor
                                                            .resolveWith(
                                                                (states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return Colors.black
                                                            .withOpacity(
                                                                0); // Change the unchecked color here
                                                      }

                                                      return Colors.black
                                                          .withOpacity(
                                                              0.5); // Default unchecked color
                                                    }),
                                                  ));
                                            }
                                          },
                                        ),
                                        Column(
                                          children: [
                                            // ... (rest of your code)
                                            // ExpansionTile(
                                            //   title: Text(roadmarkInProgressName),
                                            //   children: <Widget>[
                                            //     ListView.builder(
                                            //       shrinkWrap: true,
                                            //       itemCount: currentROT,
                                            //       itemBuilder: (context, index) {
                                            //         Row(
                                            //           children: [
                                            //             Text(tasksInRoadmark[index]),
                                            //             Spacer(),
                                            //             Checkbox(
                                            //               value: false,
                                            //               onChanged: (bool? newValue) {
                                            //                 setState(() {
                                            //                   true;
                                            //                 });
                                            //               },
                                            //             )
                                            //           ],
                                            //         );
                                            //       },
                                            //     )
                                            //   ],
                                            // ),
                                          ],
                                        )
                                      ])
                                ],
                              ))));
                }),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                child: FloatingActionButton(
                  backgroundColor: dynamiteRed,
                  child: Icon(
                    Icons.add,
                    size: iconSize,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      addProject();
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
