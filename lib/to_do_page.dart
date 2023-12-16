import 'package:flutter/material.dart';
import 'globals.dart';
import 'home_page.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
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
                if (todoItems.length < 20) {
                  // Get the text from the text field
                  String enteredText = _textEditingController.text;
                  todoItems.add(enteredText);
                  areItemsDone.add(false);
                  setState(() {});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Longer lists available with DynaManager Pro'),
                      action: SnackBarAction(
                          label: 'Get Pro',
                          onPressed: () {
                            getPro();
                          }),
                    ),
                  );
                }
                Navigator.pop(context);
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
      if (result != null) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: todoItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 3, 0),
                    child: ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        title: Text(
                          todoItems[index],
                          style: defaultText,
                        ),
                        textColor: Colors.black,
                        trailing: Checkbox(
                          value: areItemsDone[index],
                          onChanged: (bool? newValue) {
                            setState(() {
                              areItemsDone[index] = newValue ?? false;
                            });
                          },
                          checkColor: Colors.black,
                          fillColor: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.black.withOpacity(
                                  0); // Change the unchecked color here
                            }
                            return Colors.black
                                .withOpacity(0.5); // Default unchecked color
                          }),
                        )),
                  );
                }),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                child: FloatingActionButton(
                  backgroundColor: dynamiteRed,
                  child: Icon(
                    Icons.add,
                    size: iconSize,
                    color: Colors.white,
                  ),
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
