import 'package:banking_app/view/header.dart';
import 'package:banking_app/view/middle.dart';
import 'package:banking_app/widgets/recipients_list.dart';
import 'package:banking_app/widgets/transaction_list.dart';
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recent Recipients",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                        child: RecipientsList(),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Recent Transactions",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.sp,
                        ),
                      ),
                      const TransactionList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
