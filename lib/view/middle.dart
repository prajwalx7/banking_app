import 'package:banking_app/screens/money_transfer_screen.dart';
import 'package:banking_app/widgets/user_control_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Middle extends StatelessWidget {
  const Middle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: const Color(0xff272829),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserControlContainer(
                title: "Add\nMoney",
                svgPath: 'assets/icons/add.svg',
                onTap: () {}),
            UserControlContainer(
                title: "Send\nMoney",
                svgPath: 'assets/icons/transfer.svg',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MoneyTransferScreen()));
                }),
            UserControlContainer(
                title: "Request\nMoney",
                svgPath: 'assets/icons/request.svg',
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
