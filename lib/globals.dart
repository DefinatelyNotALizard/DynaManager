library dyna_manager.globals;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Global Look and feel:
const Color containerColor = Colors.white;
const Color dynamiteRed = Color(0xffff1100);
double fontSize = 23;
double iconSize = 20;
double widthMultiplier = 0.9;
double heightMultiplier = 0.8;
TextStyle defaultText = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: fontSize,
  fontWeight: FontWeight.normal,
);
TextStyle defaultTextWhite = GoogleFonts.roboto(
  color: Colors.white,
  fontSize: fontSize,
  fontWeight: FontWeight.normal,
);
TextStyle redButtonText = GoogleFonts.roboto(
  color: Colors.red,
  fontSize: fontSize * 0.9,
  fontWeight: FontWeight.normal,
);
TextStyle titleText = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: fontSize * 1.2,
  fontWeight: FontWeight.bold,
);
TextStyle subTitleText = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: fontSize * 1.1,
  fontWeight: FontWeight.bold,
);

//ToDoPage utilities:
List<String> todoItems = ['Hello', 'HelloWorld', 'Goodbye'];
List<bool> areItemsDone = [false, false, false];

//ProjectPage utilities:
List<String> projects = ["Build Wall", "Replace hedge", "Cut path"];
List<int> projectOwnsRoadmarks = [3, 3, 3];
List<String> roadmarks = [
  "Clear area",
  "Gather stones",
  "Lay stones",
  "Remove hedge",
  "Prepare ground",
  "Plant new hedges",
  "Mark path",
  "Clear path",
  "Remove debris"
];
List<int> roadmarkOwnsTasks = [2, 2, 2, 2, 3, 2, 1, 2, 1];
List<String> tasks = [
  "Cut thorns", //Clear area
  "Flatten ground", //
  "Find stones", //Gather stones
  "Transport stones", //
  "Place stones", //Lay stones
  "Backfill", ////Build wall ends here
  "Dig up hedges",
  "Remove debris",
  "Lay compost",
  "Soak ground",
  "Rotavate ground",
  "Dig holes",
  "Plant hedges",
  "Place markers",
  "Clear vines",
  "Flatten Path",
  "Cart off debris"
];
List<bool> taskStatus = [
  false,
  false,
  false,
  false,
  false,
  false, //Build wall ends here
  false,
  false,
  false,
  false,
  false,
  false,
  false, //Replace hedge ends here
  false,
  false,
  false,
  false,
];
//NavRail utilities:
int selectedIndex = 0;
