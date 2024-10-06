import 'package:banking_app/widgets/curved_list.dart';

import 'package:flutter/material.dart';

class MoneyTransferScreen extends StatelessWidget {
  const MoneyTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff272829),
      appBar: AppBar(
        backgroundColor: const Color(0xff272829),
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
            )),
      ),
      body: Column(
        children: [
          CircularScrollList(),
        ],
      ),
    );
  }
}
