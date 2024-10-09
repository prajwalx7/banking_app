import 'package:banking_app/screens/all_transactions_list.dart';
import 'package:banking_app/widgets/recipients_list.dart';
import 'package:banking_app/widgets/transaction_list.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    return Expanded(
      child: FadingEdgeScrollView.fromScrollView(
        gradientFractionOnEnd: 0.1,
        gradientFractionOnStart: 0.1,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      "Recent Recipients",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 70.h,
                      child: RecipientsList(),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                      child: Row(
                        children: [
                          Text(
                            "Transactions",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 18.sp,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllTransactionsList()));
                            },
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(6.r),
                                    left: Radius.circular(6.r),
                                  ),
                                ),
                                minimumSize: Size(40.w, 20.h),
                                backgroundColor: const Color(0xffFAF7F0),
                                foregroundColor: Colors.black),
                            child: Text(
                              'View all',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 14.sp,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const TransactionList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
