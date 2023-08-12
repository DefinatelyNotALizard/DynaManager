import 'package:flutter/material.dart';
import 'globals.dart';
//import 'home_page.dart';


class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 3, 0),
                  child: ListTile(
                    
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    title: Text(todoItems[index]),
                    textColor: Colors.black,
                    trailing: Checkbox(
                      value: doneItems[index],
                      onChanged: (bool? newValue){
                        setState(() {
                          doneItems[index] = newValue ?? false;
                        });
                      },
                      checkColor: Colors.black,
                      fillColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.black.withOpacity(0); // Change the unchecked color here
                        }
                        return Colors.black.withOpacity(0.5); // Default unchecked color
                      }),
                    )),
                );
              }
            ),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(20,20,10,20),
                child: FloatingActionButton(
                backgroundColor: dynamiteRed,
                child: Icon(Icons.add, size: iconSize, color: Colors.white,),
                onPressed: () {
                
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


