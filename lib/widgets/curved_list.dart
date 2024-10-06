import 'package:flutter/material.dart';
import 'dart:math' as math;

class CurvedList extends StatefulWidget {
  @override
  _CurvedListState createState() => _CurvedListState();
}

class _CurvedListState extends State<CurvedList> {
  final List<String> recipients =
      List.generate(20, (index) => 'assets/avatars/a${index % 10 + 1}.jpeg');

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 300,
        width: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = 60.0;
            final radius = constraints.maxWidth * 0.4;
            final centerX = constraints.maxWidth / 2;
            final centerY = constraints.maxHeight;
            final itemCount = recipients.length;
            final arcLength = math.pi;
            final totalWidth = itemWidth * itemCount;

            return SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Container(
                width: totalWidth,
                child: Stack(
                  children: List.generate(itemCount, (index) {
                    final scrollOffset = _scrollController.hasClients
                        ? _scrollController.offset
                        : 0.0;
                    final itemPosition = index * itemWidth - scrollOffset;
                    final normalizedPosition =
                        (itemPosition / constraints.maxWidth) % 1.0;
                    final angle = math.pi - normalizedPosition * arcLength;

                    final x = centerX + radius * math.cos(angle);
                    final y = centerY - radius * math.sin(angle);

                    final scale = 0.8 + 0.4 * math.sin(angle);
                    final opacity =
                        normalizedPosition >= 0 && normalizedPosition <= 1
                            ? 1.0
                            : 0.0;

                    return Positioned(
                      left: itemPosition,
                      top: y - itemWidth / 2,
                      child: Opacity(
                        opacity: opacity,
                        child: Transform.scale(
                          scale: scale,
                          child: Container(
                            width: itemWidth,
                            height: itemWidth,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(recipients[index]),
                              ),
                              border: angle > math.pi * 0.45 &&
                                      angle < math.pi * 0.55
                                  ? Border.all(color: Colors.orange, width: 3)
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
