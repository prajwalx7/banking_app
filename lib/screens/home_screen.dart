import 'package:banking_app/view/footer.dart';
import 'package:banking_app/view/header.dart';
import 'package:banking_app/view/middle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff171717),
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F5),
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
            const Footer(),
          ],
        ),
      ),
    );
  }
}
