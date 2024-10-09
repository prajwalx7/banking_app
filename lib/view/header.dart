import 'package:banking_app/widgets/bank_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:iconsax/iconsax.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  List<Widget> bankCards = [];

  @override
  void initState() {
    super.initState();
    bankCards = [
      const BankCardWidget(
          bankName: "State Bank of India",
          accountType: "Savings Account",
          balance: "19,700.00"),
      const BankCardWidget(
          bankName: "HDFC Bank",
          accountType: "Current Account",
          balance: "20,300.00"),
      const BankCardWidget(
          bankName: "ICICI Bank",
          accountType: "Savings Account",
          balance: "5,300.00"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
        gradient: LinearGradient(
            colors: [
              Color(0xff1C1C1E),
              Color(0xff323232),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.8]),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/images/avatar2.png'),
                  radius: 30.r,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome, Prajwal",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                    Text(
                      "Your wallet",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16.sp, color: Colors.white60),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: const Color(0xff272829),
                    border: Border.all(color: Colors.white, width: 0.1),
                  ),
                  child: Icon(
                    Iconsax.notification,
                    size: 24.sp,
                    color: const Color(0xffFEC260),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 220,
            child: Swiper(
              itemWidth: 320.w,
              itemHeight: 140.h,
              scrollDirection: Axis.vertical,
              itemCount: bankCards.length,
              loop: true,
              duration: 1000,
              itemBuilder: (context, index) {
                return bankCards[index];
              },
              layout: SwiperLayout.STACK,
            ),
          ),
        ],
      ),
    );
  }
}
