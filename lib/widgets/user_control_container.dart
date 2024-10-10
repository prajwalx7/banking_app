import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserControlContainer extends StatelessWidget {
  final String title;
  final String svgPath;
  final Function() onTap;
  const UserControlContainer(
      {super.key,
      required this.title,
      required this.svgPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 80.h,
        width: 90.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              height: 25.h,
              width: 25.w,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
