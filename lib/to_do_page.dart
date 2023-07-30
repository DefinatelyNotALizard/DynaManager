import 'package:flutter/material.dart';
import 'globals.dart';
import 'to_do_tile.dart';
import 'home_page.dart';


class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}



class _ToDoPageState extends State<ToDoPage> {

  void addTodoItem(String item){
    todoItems.add(item);
    setState(() {
    });
  }

  TextEditingController _textEditingController = TextEditingController();

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
                if(todoItems.length < 20){
                  // Get the text from the text field
                  String enteredText = _textEditingController.text;
                  addTodoItem(enteredText);
                  print(todoItems);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Longer lists available with DynaManager Pro'),
                      action: SnackBarAction(
                      label: 'Get Pro',
                      onPressed: () {
                        getPro();
                      }
                      ),
                    ),
                  );
                }
                Navigator.pop(context);
                print(toDoIndex);
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
        print('result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(todoItems);
    //print(toDoIndex);
    //print(todoItems[toDoIndex]);
    return Expanded(
      child:Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (BuildContext context, int index){
                print(index);
                if (index < todoItems.length) {
                  return ToDoTile();
                } else {
                  return null;
                }
                
              }
            ),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(3,20,10,20),
                child: FloatingActionButton(
                  backgroundColor: dynamiteRed,
                  child: Icon(Icons.add, size: 20, color: Colors.white,),
                  onPressed: () {
                    showPopup(context);
                  },
                ),
              ) 
            ],
          )
        ],
      ),
      
    );
  }
}