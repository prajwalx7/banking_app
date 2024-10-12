import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarManager extends StatelessWidget {
  final Widget child;
  final Color statusBarColor;
  final Brightness statusBarIconBrightness;

  const StatusBarManager({
    super.key,
    required this.child,
    required this.statusBarColor,
    this.statusBarIconBrightness = Brightness.light,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
      child: child,
    );
  }
}
