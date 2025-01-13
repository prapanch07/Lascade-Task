import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lascade_/constants/const.dart';
import '../constants/colors.dart';

class CircleImageNameWidget extends StatelessWidget {
  final String name;
  final int index;
  const CircleImageNameWidget(
      {super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 13.r,
          backgroundImage: AssetImage(profile_images[index]),
        ),
        Gap(8.w),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: unselected_nav.withOpacity(.75),
          ),
        ),
      ],
    );
  }
}
