import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularScrollList extends StatefulWidget {
  final Function(String) onDragStart;
  final Function() onDragEnd;

  const CircularScrollList(
      {super.key, required this.onDragStart, required this.onDragEnd});

  @override
  CircularScrollListState createState() => CircularScrollListState();
}

class CircularScrollListState extends State<CircularScrollList> {
  final double radius = 150;
  double _rotationAngle = 0;
  bool _isDragging = false;
  Offset? _dragStartPosition;

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
      // Reverse the direction of rotation
      _rotationAngle -= delta / radius;
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
            onPanStart: (details) {
              _dragStartPosition = details.localPosition;
            },
            onPanUpdate: (details) {
              if (_isDragging) return;

              if (_dragStartPosition != null) {
                final dragDistance =
                    (details.localPosition - _dragStartPosition!).distance;
                if (dragDistance > 10) {
                  // Threshold to start scrolling
                  _updateRotation(details.delta.dx);
                }
              }
            },
            onPanEnd: (_) {
              _dragStartPosition = null;
            },
            child: ClipRect(
              child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.65,
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
                        centerY: size / 2 - 15.h,
                        onDragStart: (String recipient) {
                          _isDragging = true;
                          widget.onDragStart(recipient);
                        },
                        onDragEnd: () {
                          _isDragging = false;
                          widget.onDragEnd();
                        },
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
  final Function(String) onDragStart;
  final Function() onDragEnd;

  const CircularItem({
    super.key,
    required this.imagePath,
    required this.index,
    required this.totalCount,
    required this.radius,
    required this.rotationAngle,
    required this.centerX,
    required this.centerY,
    required this.onDragStart,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    final double itemAngle = (2 * math.pi * index / totalCount) + rotationAngle;
    final double xPos = centerX + radius * math.cos(itemAngle);
    final double yPos = centerY + radius * math.sin(itemAngle);

    return Positioned(
      left: xPos - 30.5.w,
      top: yPos - 30.5.h,
      child: LongPressDraggable<String>(
        data: imagePath,
        feedback: Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
            ),
          ),
        ),
        childWhenDragging: Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        onDragStarted: () => onDragStart(imagePath),
        onDragEnd: (_) => onDragEnd(),
        child: Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
