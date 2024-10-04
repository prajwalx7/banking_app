import 'package:banking_app/widgets/bank_card_widget.dart';
import 'package:banking_app/widgets/user_control_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/avatar.jpeg'),
                    radius: 30.r,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, Prajwal",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      Text(
                        "Your wallet",
                        style:
                            TextStyle(color: Colors.white70, fontSize: 14.sp),
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
                      Icons.notifications_none_sharp,
                      size: 24.sp,
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
            SizedBox(height: 10.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserControlContainer(title: "Add\nMoney", icon: Icons.add),
                UserControlContainer(
                    title: "Send\nMoney", icon: Icons.arrow_outward),
                UserControlContainer(
                    title: "Request\nMoney", icon: Icons.money),
              ],
            )
          ],
        ),
      ),
    );
  }
}
