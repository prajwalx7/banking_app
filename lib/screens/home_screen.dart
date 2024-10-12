import 'package:banking_app/view/footer.dart';
import 'package:banking_app/view/header.dart';
import 'package:banking_app/view/middle.dart';
import 'package:banking_app/widgets/status_bar_manager.dart';
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
    return StatusBarManager(
      statusBarColor: const Color(0xff1E1E1E),
      statusBarIconBrightness: Brightness.light,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Header(),
                  Positioned(
                    top: 260.h,
                    left: 0,
                    right: 0,
                    child: const Middle(),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
