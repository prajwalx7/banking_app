import 'package:banking_app/screens/home_screen.dart';
import 'package:banking_app/screens/money_transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Banking App',
        darkTheme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}
