import 'dart:math';
import 'package:flutter/material.dart';
import 'globals.dart';

class PieWithHole extends StatefulWidget {
  @override
  _PieWithHoleState createState() => _PieWithHoleState();
}

class _PieWithHoleState extends State<PieWithHole> {
  double previousNet = 0;
  double balance = 0;
  double debt = 0;
  double investments = 0;
  double netWorth = 0;
  String numberLetters = 'k';
  String numberDisplayed = '0';
  double placeholderNumber = 1;
  Icon trend = Icon(Icons.trending_down, size: iconSize, color: Colors.yellow);
  late Map<String, double> data;

  @override
  void calcNewNetWorth() {
    //Calculate balance
    balance = transactionNumbers.reduce((value, element) => value + element);
    //Calculate investments
    for (var i = 0; i < transactionTypes.length; i++) {
      if (transactionTypes[i] == 'I') {
        investments += transactionNumbers[i] * (-1);
      }
    }
    //Calculate debt
    if (balance < 0) {
      debt = balance;
      balance = 0;
    }
    //Calculate networth
    netWorth = balance + debt + investments;

    if (netWorth == 0) {
      placeholderNumber = 1;
    } else {
      placeholderNumber = balance;
    }

    data = {
      'Balance': placeholderNumber,
      'Debt': debt,
      'Investments': investments,
      // Other categories...
    };
  }

  @override
  Widget build(BuildContext context) {
    double pieSize = 1;
    // Adjust the hole size as needed

    if ((MediaQuery.of(context).size.height * 0.3) >
        (MediaQuery.of(context).size.width * 0.3)) {
      pieSize = MediaQuery.of(context).size.width * 0.3;
    } else {
      pieSize = MediaQuery.of(context).size.height * 0.3;
    }
    double holeSize = pieSize * 0.7;
    calcNewNetWorth();

    if (previousNet <= netWorth) {
      trend = Icon(Icons.trending_up, size: iconSize, color: Colors.green);
    } else {
      trend = Icon(Icons.trending_down, size: iconSize, color: Colors.red);
    }

    if (netWorth < 1000) {
      numberLetters = '';
      numberDisplayed = netWorth.toString();
    }

    if (netWorth >= 1000) {
      numberLetters = 'K';
      numberDisplayed = (netWorth / 1000).toString();
    }
    if (netWorth >= 1000000) {
      numberLetters = 'M';
      numberDisplayed = (netWorth / 1000000).toString();
    }
    if (netWorth >= 1000000000) {
      numberLetters = 'B';
      numberDisplayed = (netWorth / 1000000000).toString();
    }
    if (netWorth >= 1000000000000) {
      numberLetters = 'T';
      numberDisplayed = (netWorth / 1000000000000).toString();
    }
    if (netWorth >= 1000000000000000) {
      numberLetters = 'r';
      numberDisplayed = 'Lia';
    }

    return Container(
      height: pieSize,
      width: pieSize,
      child: Stack(
        children: [
          CustomPaint(
            painter: PieChartPainter(data),
            size: Size(pieSize, pieSize),
          ),
          Center(
            child: Container(
              height: holeSize,
              width: holeSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      numberDisplayed,
                      style: indicatorText,
                    ),
                    Text(
                      numberLetters,
                      style: indicatorText,
                    ),
                    Spacer()
                  ],
                ),
                trend,
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final Map<String, double> data;
  final List<Color> colors = [
    Colors.green,
    Colors.red,
    Colors.blue,
  ];

  PieChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    double total = data.values.reduce((value, element) => value + element);
    double startAngle = 0;

    for (var entry in data.entries) {
      final paint = Paint()
        ..color = colors[data.keys.toList().indexOf(entry.key) % colors.length]
        ..style = PaintingStyle.fill;

      final sweepAngle = (entry.value / total) * 360;
      canvas.drawArc(
        Rect.fromCenter(
          center: size.center(Offset.zero),
          width: size.width,
          height: size.height,
        ),
        radians(startAngle),
        radians(sweepAngle),
        true,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double radians(double degrees) {
    return degrees * pi / 180;
  }
}
