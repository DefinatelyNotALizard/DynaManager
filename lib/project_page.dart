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
              itemCount: projectList.length,
              itemBuilder: (BuildContext context, int index){
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
                            Text(
                              projectList[index],
                              style: defaultText
                            ),
                            Spacer()
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: CustomProgressBar(
                            totalCheckpoints: 5,
                            filledCheckpoints: 2,
                            progress: 2,
                          )
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Placeholder(fallbackHeight: 20, fallbackWidth: 20,),
                            ),
                            Spacer()
                          ],
                        )
                      ],
                    ),
                    )
                  )
                );
              }
            ),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(20,20,10,20),
                child: FloatingActionButton(
                backgroundColor: dynamiteRed,
                child: Icon(Icons.add, size: iconSize, color: Colors.white,),
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