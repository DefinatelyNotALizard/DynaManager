import 'package:flutter/material.dart';
import 'globals.dart';


class WalletFab extends StatefulWidget {
  const WalletFab({super.key});

  @override
  State<WalletFab> createState() => _WalletFabState();
}

class _WalletFabState extends State<WalletFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: dynamiteRed,
        child: Icon(Icons.add, size: iconSize, color: Colors.white,),
        onPressed: () {ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Add Income source.'),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                //nothing for now
              }
            ),
          ),
        );
        },
      );
  }
}