import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:ui';

class BankCardWidget extends StatelessWidget {
  final String bankName;
  final String accountType;
  final String balance;

  const BankCardWidget({
    super.key,
    required this.bankName,
    required this.accountType,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: EdgeInsets.all(12.r),
          height: 160.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff272829).withOpacity(0.4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            border:
                Border.all(color: Colors.white.withOpacity(0.2), width: 0.3),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      bankName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      accountType,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.2), width: 0.2),
                    ),
                    child: Icon(
                      Iconsax.trash,
                      color: Colors.red,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Text(
                "₹$balance",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 54.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Balance",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
