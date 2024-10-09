import 'package:banking_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Color(0xff171717),
        statusBarIconBrightness: Brightness.light),
  );
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
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18.sp,
                  fontFamily: 'Questrial',
                ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
