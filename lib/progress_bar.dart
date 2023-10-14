import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int totalCheckpoints;
  final double progress;

  CustomProgressBar({
    required this.totalCheckpoints,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 16.0,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 17.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(1, 1, 1, 0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: progress * (totalCheckpoints - 1) * 16.0,
              height: 14.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ], //children
      ),
    );
  }
}
