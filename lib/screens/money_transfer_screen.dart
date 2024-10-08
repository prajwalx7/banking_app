import 'package:banking_app/widgets/curved_list.dart';
import 'package:banking_app/widgets/numpad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class MoneyTransferScreen extends StatefulWidget {
  const MoneyTransferScreen({super.key});

  @override
  MoneyTransferScreenState createState() => MoneyTransferScreenState();
}

class MoneyTransferScreenState extends State<MoneyTransferScreen> {
  String? selectedRecipient;
  String? draggedRecipient;
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272829),
      appBar: AppBar(
        backgroundColor: const Color(0xff272829),
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Send Money",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
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
                  draggedRecipient = recipient;
                });
              },
              onDragEnd: () {
                setState(() {
                  draggedRecipient = null;
                });
              },
            ),
            Lottie.asset(
              "assets/animations/drag_down.json",
              width: 50.w,
              height: 50.h,
            ),
            const Text(
              "Hold & Drag to select recipient",
              style: TextStyle(color: Colors.white38),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage:
                      const AssetImage("assets/images/avatar.jpeg"),
                ),
                Lottie.asset(
                  "assets/animations/send.json",
                  width: 100.w,
                  height: 100.h,
                ),
                DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage(selectedRecipient ??
                          draggedRecipient ??
                          "assets/images/avatar.jpeg"),
                    );
                  },
                  onAcceptWithDetails: (details) {
                    setState(() {
                      selectedRecipient = details.data;
                    });
                    _scrollToAmountSection();
                  },
                ),
              ],
            ),
            SizedBox(height: 100.h),
            if (selectedRecipient != null) _buildAmountSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountSection() {
    return Column(
      children: [
        Text(
          "Enter amount to transfer",
          style: TextStyle(color: Colors.white70, fontSize: 18.sp),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 200.w,
          child: TextField(
            controller: _amountController,
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
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
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF7251),
            fixedSize: Size(200.w, 40.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            "Send Money",
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
