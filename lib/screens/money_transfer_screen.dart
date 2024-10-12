import 'package:banking_app/widgets/circular_scroll_list.dart';
import 'package:banking_app/widgets/numpad.dart';
import 'package:banking_app/widgets/status_bar_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:banking_app/screens/success_screen.dart';

class MoneyTransferScreen extends StatefulWidget {
  const MoneyTransferScreen({super.key});

  @override
  MoneyTransferScreenState createState() => MoneyTransferScreenState();
}

class MoneyTransferScreenState extends State<MoneyTransferScreen> {
  String? selectedRecipient;
  bool isDragging = false;
  final ScrollController _scrollController = ScrollController();
  final MoneyMaskedTextController _amountController = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: ',',
    leftSymbol: '₹ ',
    precision: 0,
  );

  @override
  void dispose() {
    _scrollController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _scrollToAmountSection() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        300.h,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    }
  }

  void _navigateToSuccessScreen() {
    if (selectedRecipient != null) {
      Get.to(
          () => SuccessScreen(
                senderImage: "assets/images/avatar2.png",
                recipientImage: selectedRecipient!,
                amount: _amountController.text,
              ),
          transition: Transition.circularReveal,
          duration: 500.ms,
          curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarManager(
      statusBarColor: const Color(0xff1E1E1E),
      statusBarIconBrightness: Brightness.light,
      child: Scaffold(
        backgroundColor: const Color(0xff1E1E1E),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Send Money",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20.sp,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white70,
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              CircularScrollList(
                onDragStart: (String recipient) {
                  setState(() {
                    isDragging = true;
                  });
                },
                onDragEnd: () {
                  setState(() {
                    isDragging = false;
                  });
                },
              ),
              Lottie.asset(
                "assets/animations/drag_down.json",
                width: 50.w,
                height: 50.h,
              ),
              Text(
                "Hold & Drag to select recipient",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12.sp,
                    color: Colors.white38,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              _buildTransferRow(),
              SizedBox(height: 100.h),
              if (selectedRecipient != null) _buildAmountSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransferRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage: const AssetImage("assets/images/avatar2.png"),
        ),
        Lottie.asset(
          "assets/animations/send.json",
          width: 100.w,
          height: 100.h,
        ),
        DragTarget<String>(
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 80.r,
              height: 80.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
              child: ClipOval(
                child: selectedRecipient != null
                    ? Image.asset(
                        selectedRecipient!,
                        fit: BoxFit.cover,
                      )
                    : Lottie.asset(
                        "assets/animations/receiver.json",
                        height: 60.h,
                        width: 60.w,
                        fit: BoxFit.cover,
                      ),
              ),
            );
          },
          onWillAcceptWithDetails: (data) => true,
          onAcceptWithDetails: (details) {
            setState(() {
              selectedRecipient = details.data;
              isDragging = false;
            });
            _scrollToAmountSection();
          },
        ),
      ],
    );
  }

  Widget _buildAmountSection() {
    return Column(
      children: [
        Text(
          "Enter amount to transfer",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 18.sp,
              color: Colors.white70,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 200.w,
          child: TextField(
            controller: _amountController,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24.sp,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
            ),
            textAlign: TextAlign.center,
            readOnly: true,
          ),
        ),
        SizedBox(height: 20.h),
        NumPad(
          onTap: (val) {
            if (val == 'C') {
              _amountController.updateValue(0);
            } else if (val == '<') {
              _amountController.updateValue(
                _amountController.numberValue / 10,
              );
            } else {
              _amountController.updateValue(
                _amountController.numberValue * 10 + int.parse(val),
              );
            }
          },
        ),
        SizedBox(height: 30.h),
        ElevatedButton(
          onPressed: _navigateToSuccessScreen,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF7251),
            fixedSize: Size(200.w, 40.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            "Send Money",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18.sp,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
