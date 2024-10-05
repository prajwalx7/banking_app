import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class CurvedList extends StatefulWidget {
  CurvedList({Key? key}) : super(key: key);

  @override
  _CurvedListState createState() => _CurvedListState();
}

class _CurvedListState extends State<CurvedList> {
  final List<String> recipients =
      List.generate(20, (index) => 'assets/avatars/a${index % 10 + 1}.jpeg');
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 180.h,
            color: Colors.grey[900],
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = 60.w;
                final itemHeight = 60.h;
                final diameter = constraints.maxHeight * 2;
                final radius = diameter / 2;
                final itemCount = recipients.length;

                return NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification) {
                      setState(() {});
                    }
                    return true;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      final itemOffset =
                          index * itemWidth - _scrollController.offset;
                      final normalizedOffset =
                          (itemOffset / (itemCount * itemWidth)) * math.pi;
                      final x = radius * math.sin(normalizedOffset);
                      final y = radius * (1 - math.cos(normalizedOffset));

                      // Adjust vertical position to ensure items are visible
                      final adjustedY = constraints.maxHeight - y;

                      // Only render items in the visible part of the semi-circle
                      if (adjustedY < 0 || adjustedY > constraints.maxHeight) {
                        return SizedBox(width: itemWidth);
                      }

                      final scale = 0.8 + 0.2 * (y / radius);

                      return SizedBox(
                        width: itemWidth,
                        height: constraints.maxHeight,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: adjustedY - (itemHeight / 2),
                              child: Transform.scale(
                                scale: scale,
                                child: Container(
                                  width: itemWidth,
                                  height: itemHeight,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(recipients[index]),
                                    ),
                                    border: y > radius * 0.9
                                        ? Border.all(
                                            color: Colors.orange, width: 3)
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Adriana Clark',
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
          SizedBox(height: 5.h),
          Text(
            '\$180.00',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
