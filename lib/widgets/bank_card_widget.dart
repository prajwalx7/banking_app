import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 140.h,
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
                child: Text(bankName),
              ),
              SizedBox(width: 5.w),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(24)),
                child: Text(accountType),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(color: Colors.white, width: 0.1),
                ),
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            "₹$balance",
            style: TextStyle(fontSize: 48.sp),
          ),
          SizedBox(height: 5.h),
          Text(
            "Balance",
            style: TextStyle(fontSize: 18.sp, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
