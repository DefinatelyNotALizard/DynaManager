import 'package:flutter/material.dart';


class CustomProgressBar extends StatelessWidget {
  final int totalCheckpoints; // Total number of checkpoint dots
  final int filledCheckpoints; // Number of filled checkpoint dots
  final double progress; // Progress as a decimal value (0.0 to 1.0)

  CustomProgressBar({
    required this.totalCheckpoints,
    required this.filledCheckpoints,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 16.0,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              totalCheckpoints,
              (index) => Container(
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index < filledCheckpoints ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(6),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: progress * (totalCheckpoints - 1) * 16.0,
              height: 5.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
