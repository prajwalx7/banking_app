import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularScrollList extends StatefulWidget {
  @override
  _CircularScrollListState createState() => _CircularScrollListState();
}

class _CircularScrollListState extends State<CircularScrollList> {
  final double radius = 160;
  double _rotationAngle = 0;

  final List<String> recipients = [
    'assets/avatars/a8.jpeg',
    'assets/avatars/a10.jpeg',
    'assets/avatars/a9.jpeg',
    'assets/avatars/a5.jpeg',
    'assets/avatars/a4.jpeg',
    'assets/avatars/a2.jpeg',
    'assets/avatars/a3.jpeg',
    'assets/avatars/a6.jpeg',
    'assets/avatars/a1.jpeg',
    'assets/avatars/a7.jpeg',
  ];

  void _updateRotation(double delta) {
    setState(() {
      _rotationAngle += delta;
      _rotationAngle %= (2 * math.pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(constraints.maxWidth, constraints.maxHeight);
        return Center(
          child: GestureDetector(
            onPanUpdate: (details) {
              _updateRotation(details.delta.dx / radius);
            },
            child: ClipRect(
              child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.5,
                child: SizedBox(
                  width: size,
                  height: size,
                  child: Stack(
                    children: List.generate(recipients.length, (index) {
                      return CircularItem(
                        imagePath: recipients[index],
                        index: index,
                        totalCount: recipients.length,
                        radius: radius,
                        rotationAngle: _rotationAngle,
                        centerX: size / 2,
                        centerY: size / 2,
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CircularItem extends StatelessWidget {
  final String imagePath;
  final int index;
  final int totalCount;
  final double radius;
  final double rotationAngle;
  final double centerX;
  final double centerY;

  CircularItem({
    required this.imagePath,
    required this.index,
    required this.totalCount,
    required this.radius,
    required this.rotationAngle,
    required this.centerX,
    required this.centerY,
  });

  @override
  Widget build(BuildContext context) {
    final double itemAngle = (2 * math.pi * index / totalCount) + rotationAngle;
    final double xPos = centerX + radius * math.cos(itemAngle);
    final double yPos = centerY + radius * math.sin(itemAngle);

    return Positioned(
      left: xPos - 27.5.w,
      top: yPos - 27.5.h,
      child: Container(
        height: 55.h,
        width: 55.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
