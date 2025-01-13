import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:lascade_/constants/colors.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const category = [
      "Jewellery",
      "Clothes",
      "Fashion",
      "Rings",
      "Shoes",
    ];

    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: 41,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          separatorBuilder: (context, index) => const Gap(12),
          itemBuilder: (context, index) => Container(
            height: 41.h,
            width: selectedIndex == index ? 118.w : 98.w,
            decoration: BoxDecoration(
              color:
                  selectedIndex == index ? cyan_backg : const Color(0xffF1F5F5),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Center(
                child: Text(
                  category[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: selectedIndex == index
                        ? white
                        : const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
