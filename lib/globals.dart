library dyna_manager.globals;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//Global Look and feel:
const Color containerColor = Colors.white;
const Color dynamiteRed = Colors.red;
double fontSize = 23;
double iconSize = 20;
double widthMultiplier = 0.90;
TextStyle defaultText = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: fontSize,
  fontWeight: FontWeight.bold,
);

//ToDoPage utilities:
List<String> todoItems = ['Hello', 'HelloWorld', 'Goodbye'];
List<bool> areItemsDone = [false, false, false];

//ProjectPage utilities:
List<String> projectList = ['Build wall', 'Plant tree', 'Overthrow government'];

//NavRail utilities:
int selectedIndex = 0;

