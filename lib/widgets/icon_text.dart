import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lascade_/constants/colors.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconTextWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: white,
          size: 13.r,
        ),
        const Gap(4),
        Text(
          text,
          style:TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: white.withOpacity(.75),
            height: 1
          ),
        ),
      ],
    );
  }
}
