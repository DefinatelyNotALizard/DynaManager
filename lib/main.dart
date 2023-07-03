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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red,
          child: Icon(Icons.add)
        ),
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
        ],
      ),
    );
  }
}