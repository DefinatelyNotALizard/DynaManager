import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';


void main() => runApp(DynaManager());


class DynaManager extends StatelessWidget {
  const DynaManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DynaManager'),
          backgroundColor: Colors.red,
        ),
        body: VaryingPage(),
      ),
    );
  }
}

class VaryingPage extends StatefulWidget {
  const VaryingPage({super.key});

  @override
  State<VaryingPage> createState() => _VaryingPageState();
}

class _VaryingPageState extends State<VaryingPage> {

  int _selectedIndex = 0;
  List<Widget> _mainContainerOptions = <Widget>[

    Container(
      child: Icon(Icons.home, size: 30,),
    ),
    Container(
      child: Icon(Icons.check_box, size: 30,),
    ),
    Container(
      child: Icon(Icons.assignment, size: 30,),
    ),
    Container(
      child: Icon(Icons.trending_up, size: 30,),
    ),

  ];

  List<Widget> _fabIconOptions = <Widget> [

    Icon(Icons.build, size: 20,),
    Icon(Icons.add, size: 20,),
    Icon(Icons.add, size: 20,),
    Icon(Icons.add, size: 20,),

  ];  

  List<Widget> _fabActionMessage = <Widget> [

    Text('Home screen configuration available with DynaManager Pro.'),
    Text('Add ToDo item.'),
    Text('Add project.'),
    Text('Something or other.'),

  ];  

  List<String> _fabActionLabel = <String> [

    'Get Pro',
    'OK',
    'OK',
    'OK',

  ];  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            selectedIconTheme: IconThemeData(color: Colors.red),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            indicatorColor: Colors.red,
            onDestinationSelected: (int index){
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: [
            NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
            NavigationRailDestination(icon: Icon(Icons.check_box), label: Text('To do')),
            NavigationRailDestination(icon: Icon(Icons.assignment), label: Text('Projects')),
            NavigationRailDestination(icon: Icon(Icons.trending_up), label: Text('Wallet')),
            ],
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Center(
                child: _mainContainerOptions.elementAt(_selectedIndex),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: _fabIconOptions.elementAt(_selectedIndex),
        onPressed: () {ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: _fabActionMessage.elementAt(_selectedIndex),
            action: SnackBarAction(
              label: _fabActionLabel.elementAt(_selectedIndex),
              onPressed: () {
                //Get Pro
              }
            ),
          ),
        );
        },
      ),
      

    );
  }
}