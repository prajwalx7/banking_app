import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class BankCardWidget extends StatelessWidget {
  final String bankName;
  final String accountType;
  final String balance;

  const BankCardWidget(
      {super.key,
      required this.bankName,
      required this.accountType,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.r),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xff272829),
          border: Border.all(color: Colors.white, width: 0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(24)),
                child: Text(
                  bankName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white60,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(width: 5.w),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(24)),
                child: Text(
                  accountType,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white60,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(color: Colors.white, width: 0.1),
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
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            "Balance",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
                color: Colors.white70,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
