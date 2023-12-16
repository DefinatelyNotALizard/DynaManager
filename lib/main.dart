import 'package:flutter/material.dart';
import 'globals.dart';
import 'home_page.dart';
import 'to_do_page.dart';
import 'project_page.dart';
import 'wallet_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DynaManager());
}

String getItemTD(indexTD) {
  return todoItems[indexTD];
}

class DynaManager extends StatelessWidget {
  const DynaManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: dynamiteRed,
          title: Text(
            'DynaManager',
            style: TextStyle(color: Colors.white, fontFamily: 'Vina Sans'),
          ),
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
  List<Widget> _mainContainerOptions = <Widget>[
    HomePage(),

    ToDoPage(), //DO NOT ENCLOSE IN A CENTER WIDGET, IT WILL BREAK, I MEAN TOTAL FAILIURE, DOES NOT WORK IN THE SLIGHTEST.

    ProjectPage(), //DO NOT ENCLOSE IN A CENTER WIDGET, IT WILL BREAK, I MEAN TOTAL FAILIURE, DOES NOT WORK IN THE SLIGHTEST.

    Center(
      child: WalletPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            selectedIconTheme: IconThemeData(color: dynamiteRed),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            indicatorColor: dynamiteRed,
            onDestinationSelected: (int index) {
              if (selectedIndex != 1) {}
              setState(() {
                selectedIndex = index;
              });
            },
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.check_box), label: Text('To do')),
              NavigationRailDestination(
                  icon: Icon(Icons.assignment), label: Text('Projects')),
              NavigationRailDestination(
                  icon: Icon(Icons.trending_up), label: Text('Wallet')),
            ],
          ),
          _mainContainerOptions.elementAt(selectedIndex),
        ],
      ),
    );
  }
}
