import 'package:banking_app/widgets/status_bar_manager.dart';
import 'package:banking_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllTransactionsList extends StatefulWidget {
  const AllTransactionsList({super.key});

  @override
  State<AllTransactionsList> createState() => _AllTransactionsListState();
}

class _AllTransactionsListState extends State<AllTransactionsList> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return StatusBarManager(
      statusBarColor: const Color(0xffF5F5F5),
      statusBarIconBrightness: Brightness.light,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          title: Text(
            "Transactions",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black87,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xffF5F5F5),
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: Wrap(
                  spacing: 10.w,
                  children: [
                    FilterChip(
                      label: Text(
                        "All",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      selected: selectedFilter == 'All',
                      onSelected: (bool selected) {
                        setState(() {
                          selectedFilter = 'All';
                        });
                      },
                      selectedColor: Colors.blue,
                      checkmarkColor: Colors.white,
                    ),
                    FilterChip(
                      label: Text(
                        "Credited",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      selected: selectedFilter == 'credit',
                      onSelected: (bool selected) {
                        setState(() {
                          selectedFilter = 'credit';
                        });
                      },
                      selectedColor: Colors.green,
                      checkmarkColor: Colors.white,
                    ),
                    FilterChip(
                      label: Text(
                        "Debited",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                      selected: selectedFilter == 'debit',
                      onSelected: (bool selected) {
                        setState(() {
                          selectedFilter = 'debit';
                        });
                      },
                      selectedColor: Colors.red,
                      checkmarkColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: TransactionList(filterType: selectedFilter),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
