import 'package:flutter/material.dart';
import 'globals.dart';


void getPro(){
  //Get Pro
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index){
                print(index);
                return Container(
                    margin: const EdgeInsets.fromLTRB(30, 20, 3, 20),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    width: MediaQuery.of(context).size.width * widthMultiplier,
                    //height: MediaQuery.of(context).size.height * heightMultiplier,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: containerColor,
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.home, size: iconSize, color: Colors.black,),
                      ],
                    )
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
                child: Icon(Icons.build, size: 20, color: Colors.white,),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Home screen configuration available with DynaManager Pro.'),
                      action: SnackBarAction(
                      label: 'Get Pro',
                      onPressed: () {
                        getPro();
                      }
                      ),
                    ),
                  );
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


/* class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(30, 20, 0, 20),
        width: MediaQuery.of(context).size.width * widthMultiplier,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        child: Row(
          children: [
            Spacer(),
            Icon(Icons.home, size: iconSize, color: Colors.black,),
            Spacer(),
          ],
        ),
      );
  }
}


 */


