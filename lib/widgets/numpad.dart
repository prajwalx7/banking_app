import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumPad extends StatelessWidget {
  final Function(String) onTap;

  const NumPad({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        children: ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'C', '0', '<']
            .map((key) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextButton(
              onPressed: () => onTap(key),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white24,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                key,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 26.sp,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
