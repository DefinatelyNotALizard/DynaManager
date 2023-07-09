import 'package:flutter/material.dart';
import 'globals.dart';
import 'to_do_tile.dart';


class ToDoFab extends StatefulWidget {
  const ToDoFab({super.key});

  @override
  State<ToDoFab> createState() => _ToDoFabState();
}

class _ToDoFabState extends State<ToDoFab> {

  TextEditingController _textEditingController = TextEditingController();

   

  void addTodoItem(String item){
    setState(() {
      todoItems.add(item);
    });
  }

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
          return ToDoTile(
            
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void showPopup(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Type something...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Get the text from the text field
                String enteredText = _textEditingController.text;
                // Close the pop-up and return the entered text
                Navigator.of(context).pop(enteredText);
                addTodoItem(enteredText);
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () {
                // Close the pop-up without returning any text
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    ).then((result) {
      // Handle the result of the dialog
      if (result != null) {
        print('Entered text: $result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: dynamiteRed,
        child: Icon(Icons.add, size: 20, color: Colors.white,),
        onPressed: () {
          showPopup(context);
          },
    );
  }
}