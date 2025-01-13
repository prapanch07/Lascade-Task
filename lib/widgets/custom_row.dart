import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lascade_/constants/colors.dart';

class CustomRowWidget extends StatelessWidget {
  final String left;
  final String right;
  final bool isaccountscreen;
  final bool isdetailspage;
  const CustomRowWidget(
      {super.key,
      required this.left,
      required this.right,
      this.isaccountscreen = false,
      this.isdetailspage = false});

  @override
  Widget build(BuildContext context) {
    final style_title = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 20.sp,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isaccountscreen ? 0.sp : 24.sp),
      child: Row(
        children: [
          Text(
            left,
            style: style_title,
          ),
          const Spacer(),
          Text(
            right,
            style: TextStyle(
              fontSize: isdetailspage ? 16.sp : 14.sp,
              fontWeight: FontWeight.w800,
              color: cyan_backg,
            ),
          ),
        ],
      ),
    );
  }
}
