import 'package:banking_app/widgets/user_control_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserControlContainer(title: "Add\nMoney", icon: Iconsax.add),
            UserControlContainer(
                title: "Send\nMoney", icon: Iconsax.arrow_up_3),
            UserControlContainer(
                title: "Request\nMoney", icon: Iconsax.receive_square),
          ],
        ),
      ),
    );
  }
}
