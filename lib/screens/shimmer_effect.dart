import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar Shimmer
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 56.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 10.r,
                              backgroundColor: Colors.grey,
                            ),
                            Gap(8.w),
                            Container(
                              height: 14.h,
                              width: 100.w,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 12.r,
                          backgroundColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Gap(12.h),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 24.h,
                      width: 200.w,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Gap(24.h),

            // "Featured" Title Shimmer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 24.h,
                  width: 120.w,
                  color: Colors.grey,
                ),
              ),
            ),
            Gap(12.h),

            // Featured Card Shimmer
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                height: 190.h,
                child: ListView.separated(
                  // scrollDirection: Axis.horizontal,
                  itemCount:2,
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 172.h,
                        width: 264.w,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Gap(24.h),

            // "Category" Title Shimmer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 24.h,
                      width: 100.w,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 24.h,
                      width: 60.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            Gap(12.h),

            // Categories Shimmer
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                height: 120.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 120.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Gap(24.h),

            // "Popular Recipes" Title Shimmer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 24.h,
                      width: 150.w,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 24.h,
                      width: 60.w,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            Gap(12.h),

            // Popular Recipes Card Shimmer
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.33,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  separatorBuilder: (context, index) => Gap(8.w),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.33,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
