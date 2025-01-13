import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lascade_/constants/colors.dart';

class AnimatedOutlinedCounter extends StatefulWidget {
  final double borderRadius;
  const AnimatedOutlinedCounter({super.key, this.borderRadius = 100});

  @override
  State<AnimatedOutlinedCounter> createState() =>
      _AnimatedOutlinedCounterState();
}

class _AnimatedOutlinedCounterState extends State<AnimatedOutlinedCounter> {
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: decrement,
          child: Container(
            height: 24.h,
            width: 24.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: count == 1 ? const Color(0xffCCD4DE) : cyan_backg,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Icon(
                Icons.remove,
                size: 15,
                color: count == 1 ? const Color(0xffCCD4DE) : cyan_backg,
              ),
            ),
          ),
        ),
        // const SizedBox(width: 10),
        Container(
          height: 24.h,
          width: 24.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.white,
          ),
          child: Text(
            '$count',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
        ),
        InkWell(
          onTap: increment,
          child: Container(
            height: 24.h,
            width: 24.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: cyan_backg,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child:  Center(
              child: Icon(
                Icons.add,
                size: 15.r,
                color: cyan_backg,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
