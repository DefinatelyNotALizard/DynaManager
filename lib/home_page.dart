import 'package:flutter/material.dart';
import 'globals.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      width: MediaQuery.of(context).size.width * widthMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Center(
        child: Icon(Icons.home, size: iconSize)
      ),
    );
  }
}