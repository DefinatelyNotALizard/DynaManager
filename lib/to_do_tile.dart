import 'package:flutter/material.dart';
import 'globals.dart';


String getItem(){
  String item = todoItems[toDoIndex];
  toDoIndex++;
  print(item);
  return item;
}

class ToDoTile extends StatefulWidget {
  const ToDoTile({super.key});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {

  String _name = getItem();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 20, 20, 0),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      width: MediaQuery.of(context).size.width * widthMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            _name,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Spacer(),
          Icon(
            Icons.delete,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}