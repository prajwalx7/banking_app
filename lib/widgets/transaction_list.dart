import 'package:banking_app/model/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return transactionCard(transaction['svgPath']!, transaction['name']!,
              transaction['time']!, transaction['amount']!);
        });
  }
}

Widget transactionCard(
    String svgPath, String name, String time, String amount) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SvgPicture.asset(svgPath, height: 20.h, width: 20.w),
          Column(
            children: [
              Text(name),
              Text(time),
            ],
          ),
          const Spacer(),
          Text(amount),
        ],
      ),
    ),
  );
}
