import 'package:flutter/material.dart';
import 'globals.dart';


class HomeFab extends StatefulWidget {
  const HomeFab({super.key});

  @override
  State<HomeFab> createState() => _HomeFabState();
}

class _HomeFabState extends State<HomeFab> {

  void getPro(){
    //Get Pro
  }


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: dynamiteRed,
        child: Icon(Icons.build, size: 20, color: Colors.white,),
        onPressed: () {ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Home screen configuration available with DynaManager Pro.'),
            action: SnackBarAction(
              label: 'Get Pro',
              onPressed: () {
                getPro();
              }
            ),
          ),
        );
        },
      );
  }
}
