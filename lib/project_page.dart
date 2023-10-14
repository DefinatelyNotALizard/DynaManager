//import 'dart:async';

import 'package:flutter/material.dart';
import 'globals.dart';
import 'progress_bar.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
                  List tasksInProject = tasks.sublist(
                      previousTasks, previousTasks + currentTasks);
                  //completedTasks is the amount of tasks in the project that are completed, this is captain obvious, signing off.
                  int completedTasksDoomed = 0;
                  //Counts the amount of balls on the progress bar that are filled, it may in fact be obsolete, must investigate SOMETHING TO DO HERE!!!!!!!!!
                  int filledBalls = 0;
                  //Here we increment completedTasks for every "true" we find in the List taskStatus (which stores bools matched by their index to the tasks list)
                  for (var taskBeingChecked = 0;
                      taskBeingChecked < tasksInProject.length;
                      taskBeingChecked++) {
                    if (taskStatus[taskBeingChecked + previousTasks] == true) {
                      completedTasksDoomed++;
                    } else {
                      break;
                    }
                  }
                  //Since compTaskDoo is doomed to be decremented after this, here i store it's initial state for later use
                  int completedTasks = completedTasksDoomed;
                  //Here we increment filledBalls by chopping bit off completedtasks based on the current roadmark's required number of tasks, the remainder is used later
                  for (var roadmarkBeingChecked = 0;
                      roadmarkBeingChecked <
                          previousRoadmarks +
                              projectOwnsRoadmarks[index] -
                              previousRoadmarks;
                      roadmarkBeingChecked++) {
                    if (completedTasksDoomed >=
                        roadmarkOwnsTasks[roadmarkBeingChecked]) {
                      completedTasksDoomed -=
                          roadmarkOwnsTasks[roadmarkBeingChecked];
                      filledBalls++;
                    } else {
                      break;
                    }
                  }
                  //currentROT is the amount of tasks in the roadmark that the previous for loop stopped at because all the tasks in it were not labelled "true"
                  int currentROT = roadmarkOwnsTasks[filledBalls];
                  //The following list is a list of ints representing the elements of roadmarkOwnsTasks that have been fulfilled   CHECK OBSOLESCENCE
                  List<int> completedRoadmarkTaskOwnership =
                      roadmarkOwnsTasks.sublist(0, filledBalls);
                  //The following is a list of bools that are associated with the current uncomplete roadmark's tasks
                  List currentTaskStats = [];
                  //if there are some compleed roadmarks then take a segment from the middle of taskStatus else take it from the start
                  if (completedRoadmarkTaskOwnership.isNotEmpty) {
                    currentTaskStats = taskStatus.sublist(
                        completedRoadmarkTaskOwnership
                            .reduce((value, element) => value + element),
                        completedRoadmarkTaskOwnership
                                .reduce((value, element) => value + element) +
                            currentROT);
                  } else {
                    currentTaskStats = taskStatus.sublist(0, currentROT);
                  }
                  return Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 3, 0),
                      child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(projects[index], style: defaultText),
                                    Spacer()
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: CustomProgressBar(
                                      totalCheckpoints:
                                          projectOwnsRoadmarks[index],

                                      //While filledBalls is maybe obsolete, progress is the lengtth of the bar
                                      progress:
                                          (MediaQuery.of(context).size.width) /
                                              currentTasks *
                                              completedTasks,
                                    )),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          Text("Testing"),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )));
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
                    //nothing
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
/*     ),
    );
  }
} */
