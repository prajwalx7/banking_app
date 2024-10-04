import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserControlContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  const UserControlContainer(
      {super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 90.w,
      decoration: BoxDecoration(
          color: const Color(0xffFF7251),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40.sp,
            color: Colors.black,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
