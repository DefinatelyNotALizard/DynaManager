import 'package:flutter/material.dart';
import 'globals.dart';


class ProjectFab extends StatefulWidget {
  const ProjectFab({super.key});

  @override
  State<ProjectFab> createState() => _ProjectFabState();
}

class _ProjectFabState extends State<ProjectFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: dynamiteRed,
        child: Icon(Icons.add, size: 20, color: Colors.white,),
        onPressed: () {ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Add project.'),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                //nothing for now
              }
            ),
          ),
        );
        },
      );
  }
}