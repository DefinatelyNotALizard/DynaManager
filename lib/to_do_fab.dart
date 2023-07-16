import 'package:flutter/material.dart';
import 'globals.dart';
import 'to_do_tile.dart';
import 'to_do_page.dart';

//StreamController<bool> _controller = StreamController<bool>.broadcast();

bool itemAdded = false;

class FABtodoNew extends StatelessWidget {
  final VoidCallback callback;

  FABtodoNew({required this.callback});

  TextEditingController _textEditingController = TextEditingController();
  
   

  void addTodoItem(String item){
    todoItems.add(item);
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

  /* void dispose() {
    _textEditingController.dispose();
    super.dispose();
  } */

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
                itemAdded = false;
                // Get the text from the text field
                String enteredText = _textEditingController.text;
                // Close the pop-up andMyWidget);
                addTodoItem(enteredText);
                print(todoItems);
                toDoLength++;
                itemAdded = true;
                
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
