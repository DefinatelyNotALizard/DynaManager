import 'package:flutter/material.dart';
import 'globals.dart';
import 'to_do_tile.dart';


class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  
  void removeTodoItem(int index){
    setState(() {
      todoItems.removeAt(index);
    });
  }

  Widget buildTodoList(){
    return Expanded(
      child: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToDoTile(),
      ],
    );

  }
}