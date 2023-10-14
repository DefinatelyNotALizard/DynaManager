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
  "Cut thorns",
  "Flatten ground",
  "Find stones",
  "Transport stones",
  "Place stones",
  "Backfill",
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
  true,
  true,
  true,
  true,
  true,
  true,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
//NavRail utilities:
int selectedIndex = 0;
