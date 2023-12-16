import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      width: double.infinity,
      height: 16.0,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 17.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double availableWidth = constraints.maxWidth;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: availableWidth * progress,
                    height: 14.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
                },
              )),
        ], //children
      ),
    );
  }
}
