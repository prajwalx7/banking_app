import 'dart:ui';
import 'package:banking_app/screens/money_transfer_screen.dart';
import 'package:banking_app/widgets/user_control_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Middle extends StatelessWidget {
  const Middle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xff272829).withOpacity(0.3),
              border: Border.all(color: Colors.white60, width: 0.2),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
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
                              builder: (context) =>
                                  const MoneyTransferScreen()));
                    }),
                UserControlContainer(
                    title: "Request\nMoney",
                    svgPath: 'assets/icons/request.svg',
                    onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
