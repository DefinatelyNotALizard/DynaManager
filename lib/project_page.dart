import 'package:flutter/material.dart';
import 'globals.dart';


class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(30, 20, 0, 20),
        width: MediaQuery.of(context).size.width * widthMultiplier,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Center(
          child: Icon(Icons.assignment, size: iconSize,color: Colors.black,),
        ),
      ),
    );
  }
}