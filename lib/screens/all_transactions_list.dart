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
    return Scaffold(
      backgroundColor: const Color(0xffC8C9C7),
      appBar: AppBar(
        title: const Text(
          "Transactions",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffC8C9C7),
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
                    label: const Text("All"),
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
                    label: const Text("Credited"),
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
                    label: const Text("Debited"),
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
    );
  }
}
