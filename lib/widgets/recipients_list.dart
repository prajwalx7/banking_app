import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipientsList extends StatelessWidget {
  RecipientsList({super.key});

  final ScrollController scrollController = ScrollController();
  final List<String> recipients = [
    'assets/avatars/a8.jpeg',
    'assets/avatars/a10.jpeg',
    'assets/avatars/a9.jpeg',
    'assets/avatars/a5.jpeg',
    'assets/avatars/a4.jpeg',
    'assets/avatars/a2.jpeg',
    'assets/avatars/a3.jpeg',
    'assets/avatars/a6.jpeg',
    'assets/avatars/a1.jpeg',
    'assets/avatars/a7.jpeg',
  ];

  final List<String> recipientNames = [
    'Jane',
    'John',
    'Sophie',
    'Alex',
    'Mike',
    'Emma',
    'Chris',
    'Liam',
    'Noah',
    'Olivia',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: recipients.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: SizedBox(
          width: 70.w,
          child: Column(
            children: [
              Container(
                height: 72.h,
                width: 55.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      recipients[index],
                    ),
                  ),
                ),
              ),
              Text(
                recipientNames[index],
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
