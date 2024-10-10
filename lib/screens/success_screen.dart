import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  final String senderImage;
  final String recipientImage;
  final String amount;

  const SuccessScreen({
    super.key,
    required this.senderImage,
    required this.recipientImage,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272829),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: AssetImage(senderImage),
                  ),
                  Lottie.asset(
                    "assets/animations/send.json",
                    width: 120.w,
                    height: 120.h,
                    repeat: false,
                  ),
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: AssetImage(recipientImage),
                  ),
                ],
              ),
              Lottie.asset(
                "assets/animations/success.json",
                width: 200.w,
                height: 200.h,
                repeat: false,
              ),
              Text(
                "Transfer Successful!",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 50.h),
              Text(
                "Amount Sent:",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white70,
                    ),
              ),
              Text(
                amount,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.sp),
              ),
              SizedBox(height: 50.h),
              InkWell(
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 50.0.w, vertical: 10.h),
                    child: Text(
                      "Back to Home",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
