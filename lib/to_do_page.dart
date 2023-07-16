import 'package:flutter/material.dart';
import 'globals.dart';
import 'to_do_tile.dart';
import 'to_do_fab.dart';


void refreshTodos(){
  
}


class ToDoPage extends StatefulWidget {
  final itemAdded;
  
  const ToDoPage({required this.itemAdded});

  


  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  

  


  void refreshTodos(){
    setState(() {
      toDoIndex = 0;
      });
  }
  
  void removeTodoItem(int index){
    setState(() {
      todoItems.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
          itemCount: toDoLength,
          itemBuilder: (BuildContext context, int index){
            return ToDoTile();
          }
          ),
        ),
        Row(
          children: [
            Spacer(),
            FABtodoNew(callback: callback)
          ],
        )
      ],
    );
    
  }
}