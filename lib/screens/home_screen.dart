import 'package:banking_app/view/header.dart';
import 'package:banking_app/view/middle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC8C9C7),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Header(),
                Positioned(
                  top: 270.h,
                  left: 0,
                  right: 0,
                  child: const Middle(),
                ),
              ],
            ),
            SizedBox(height: 60.h),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Recent Recipients",
                style: TextStyle(color: Colors.black),
              ),
            ),
           
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Recent Transactions",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
