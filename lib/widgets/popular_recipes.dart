import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/constants/const.dart';

class PopularRecipes extends StatelessWidget {
  final List products;
  final bool isdetails;
  const PopularRecipes(
      {super.key, required this.products, this.isdetails = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isdetails ? 0 : 24.w),
      child: SizedBox(
        height: 155.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final image = products[index].image;
            return Container(
              decoration: card_shadow,
              width: 130.w,
              child: Card(
                color: white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image(
                          height: 84.h,
                          width: 84.w,
                          fit: BoxFit.cover,
                          image: NetworkImage(image),
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        products[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: black_text,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Gap(8.w),
          itemCount: products.length,
        ),
      ),
    );
  }
}
