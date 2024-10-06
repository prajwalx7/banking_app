import 'package:flutter/material.dart';
import 'dart:math' as math;

class CurvedList extends StatefulWidget {
  @override
  _CurvedListState createState() => _CurvedListState();
}

class _CurvedListState extends State<CurvedList> {
  final List<String> recipients =
      List.generate(20, (index) => 'assets/avatars/a${index % 10 + 1}.jpeg');

  // Scroll Controller to control the scrolling
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add listener to the scroll controller
    _scrollController.addListener(() {
      setState(() {}); // Call setState to redraw the semicircle on scroll
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 300, // Height of the semicircle container
            width: double.infinity, // Full width
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = 60.0; // Width of each avatar
                final radius =
                    constraints.maxWidth * 0.4; // Radius of the semicircle
                final centerX =
                    constraints.maxWidth / 2; // X-center of the semicircle
                final centerY =
                    constraints.maxHeight; // Y-center of the semicircle
                final itemCount = recipients.length; // Total number of avatars
                final arcLength =
                    math.pi; // Length of the semicircle in radians

                return Stack(
                  children: List.generate(itemCount, (index) {
                    // Calculate the offset based on scroll position
                    final normalizedOffset =
                        (_scrollController.offset + index * itemWidth) %
                            (itemWidth * itemCount);
                    final progress = normalizedOffset / (itemWidth * itemCount);
                    final angle = math.pi - progress * arcLength;

                    // Calculate the x and y positions on the semicircle
                    final x = centerX + radius * math.cos(angle);
                    final y = centerY - radius * math.sin(angle);

                    // Calculate the scale factor based on position
                    final scale = 0.8 + 0.4 * math.sin(angle);

                    return Positioned(
                      left: x - itemWidth / 2, // Position avatar horizontally
                      top: y - itemWidth / 2, // Position avatar vertically
                      child: Transform.scale(
                        scale: scale, // Apply scaling
                        child: Container(
                          width: itemWidth,
                          height: itemWidth,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(recipients[index]),
                            ),
                            border:
                                angle > math.pi * 0.9 && angle < math.pi * 1.1
                                    ? Border.all(
                                        color: Colors.orange,
                                        width: 3) // Highlight center avatar
                                    : null,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          SizedBox(height: 20), // Space between semicircle and the rest
          Container(
            height: 80, // Height for the horizontal list
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: recipients.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 60,
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(recipients[index]), // Display the avatar
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
