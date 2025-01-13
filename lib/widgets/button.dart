import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/screens/navigation/common.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  const CustomButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: () => navigateToCommonScreen(context),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: white,
            ),
          ),
        ),
      ),
    );
  }

  void navigateToCommonScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CommonScreen(),
      ),
    );
  }
}
