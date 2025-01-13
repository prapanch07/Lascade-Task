import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lascade_/constants/colors.dart';
// ignore: unused_import
import 'package:lascade_/constants/const.dart';

class HeartWidget extends StatelessWidget {
  final Color color;
  final double radius;
  final String img;
  final bool isdetailspage;
  final double iconsize;
  const HeartWidget({
    super.key,
    required this.color,
    required this.radius,
    required this.img,
    this.isdetailspage = false,
    this.iconsize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: !isdetailspage ? 28.h : 40.h,
      width: !isdetailspage ? 28.w: 40.w,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding:  EdgeInsets.all(!isdetailspage? 0.0 : 8),
        child: Image(
          height: !isdetailspage ? 16.h : 24.h,
          width: !isdetailspage ? 16.w : 24.w,
          image: AssetImage(img),
        ),
      ),
    );
  }
}
