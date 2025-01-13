
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/constants/const.dart';
import 'package:lascade_/screens/common.dart';
import 'package:lascade_/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: cyan_backg,
      appBar: AppBar(
        backgroundColor: cyan_backg,
        elevation: 0,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 22.w),
            child: Center(
              child: InkWell(
                onTap: () => navigateToCommonScreen(context),
                child:  Text(
                  "Later",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image(
            height: screenHeight,
            fit: BoxFit.cover,
            width: screenWidth,
            image: const AssetImage(components),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text(
                  "Help your path to health goals with happiness",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Sofia-Pro",
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      color: white),
                ),
                Gap(24.h),
                Padding(
                    padding: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 24.h, bottom: 16.h),
                    child:
                        const CustomButton(text: "Login", color: black_text)),
                InkWell(
                  onTap: () => navigateToCommonScreen(context),
                  child:  Text(
                    "Create New Account",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: white,
                    ),
                  ),
                ),
                Gap(70.h),
                const Image(
                  height: 5,
                  width: 134,
                  image: AssetImage(home_indicator),
                ),
                Gap(8.h)
              ],
            ),
          ),
        ],
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
