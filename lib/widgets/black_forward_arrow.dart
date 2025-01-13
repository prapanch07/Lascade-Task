import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lascade_/constants/colors.dart';

class BlackForwardArrow extends StatelessWidget {
  const BlackForwardArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16.r,
      backgroundColor: black_text,
      child: Icon(
        Icons.arrow_forward,
        size: 16.r,
        color: white,
      ),
    );
  }
}
