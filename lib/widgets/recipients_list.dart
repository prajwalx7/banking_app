import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipientsList extends StatelessWidget {
  RecipientsList({super.key});

  final ScrollController scrollController = ScrollController();
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: recipients.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            height: 55.h,
            width: 55.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  recipients[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
