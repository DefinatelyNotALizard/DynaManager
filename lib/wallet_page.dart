import 'package:flutter/material.dart';
import 'globals.dart';


class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      width: MediaQuery.of(context).size.width * widthMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Center(
        child:  Icon(Icons.trending_up, size: iconSize,),
      ),
    );
  }
}