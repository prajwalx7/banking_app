import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  final String sender;
  final String senderImage; // Sender's image path
  final String receiver;
  final String receiverImage; // Receiver's image path
  final String amount;

  const SuccessScreen({
    super.key,
    required this.sender,
    required this.senderImage,
    required this.receiver,
    required this.receiverImage,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272829),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(senderImage),
                ),
                const SizedBox(width: 20),
                Lottie.asset(
                  "assets/animations/send.json",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(receiverImage),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "From: $sender",
              style: const TextStyle(color: Colors.white70, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "To: $receiver",
              style: const TextStyle(color: Colors.white70, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Rs $amount transferred successfully",
              style: const TextStyle(color: Colors.white70, fontSize: 20),
            ),
            Lottie.asset("assets/animations/success.json",
                width: 300.w, height: 300.h),
          ],
        ),
      ),
    );
  }
}
