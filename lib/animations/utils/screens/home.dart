// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice/animations/utils/extenstion.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  late List<Offset> _circlePositions;
  late List<Color> _circleColors;
  final int _circleCount = 50;
  final double _circleRadius = 10;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    _circlePositions = List.generate(_circleCount,
        (index) => Offset(_random.nextDouble(), _random.nextDouble()));
    _circleColors = List.generate(
      _circleCount,
      (index) => Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      ),
    );

    // _controller.addListener(() {
    //   setState(() {
    //     _circlePositions = List.generate(
    //       _circleCount,
    //       (index) => Offset(
    //         _random.nextDouble() * 300, // Adjust based on the canvas size
    //         _random.nextDouble() * 300,
    //       ),
    //     );
    //   });
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.green,
        child: CustomPaint(
          painter: SmileyPainter(),
          child: Center(
            child: Container(
              child: const Text(
                'HI,CHIEF NATTY',
                style: TextStyle(color: Colors.purple),
              ).fadeIn(),
            ),
          ),
        ).slideInFromBottom(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    final paint = Paint()..color = Colors.purple;

    final path = Path();

    double height = 100;
    double width = 100;
    double radius = 500;

    path.lineTo(0, height);
    path.arcToPoint(Offset(width, 0),
        radius: Radius.circular(radius), clockwise: false);

    path.close();
    paint.color = Colors.purple;
    canvas.drawPath(path, paint);

    final path2 = Path();

    // path2.lineTo(size.width * 0.9, 200);
    path2.arcToPoint(Offset(width, 0), radius: Radius.circular(radius));

    path2.close();
    paint.color = Colors.purple;
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BackgroundPainter extends CustomPainter {
  final List<Offset> circlePositions;
  final List<Color> circleColors;
  final double circleRadius;
  BackgroundPainter({
    required this.circlePositions,
    required this.circleColors,
    required this.circleRadius,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final random = Random();

    for (int i = 0; i < circlePositions.length; i++) {
      final paint = Paint()
        ..color = circleColors[i]
        ..style = PaintingStyle.fill;
      final offset = Offset(
        random.nextDouble() * size.width,
        random.nextDouble() * size.height,
      );
      canvas.drawCircle(offset, 5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.purple;
    final center = Offset(size.width / 2, size.height / 2);

    const radius = 150;

    canvas.drawCircle(center, radius.toDouble(), paint);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius / 2),
        0,
        pi,
        false,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20);

    canvas.drawCircle(Offset(center.dx - radius / 2, center.dy - radius / 2),
        20, Paint()..color = Colors.black);
    canvas.drawCircle(Offset(center.dx + radius / 2, center.dy - radius / 2),
        20, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
