import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/constants/const.dart';
import 'package:lascade_/screens/login.dart';
import 'package:lascade_/screens/navigation/home.dart';
import 'package:lascade_/widgets/button.dart';
import 'package:lascade_/widgets/counter.dart';
import 'package:lascade_/widgets/custom_row.dart';
import 'package:lascade_/widgets/heart_widget.dart';
import 'package:lascade_/widgets/icon_text.dart';
import 'package:lascade_/widgets/popular_recipes.dart';
import 'package:lascade_/widgets/tab_bar.dart';

class DetailsPage extends StatelessWidget {
  final List products;
  final image;
  const DetailsPage({super.key, required this.products, required this.image});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight * 2.08.h,
          child: Stack(
            children: [
              Image(
                height: screenHeight * .4,
                fit: BoxFit.cover,
                width: double.infinity,
                image: NetworkImage(image),
              ),
              Positioned(
                top: 280.h,
                child: Container(
                  height: screenHeight * 3.h,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      // physics: NeverScrollableScrollPhysics(),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          height: 4.h,
                          width: 4.w,
                          // background: #E3EBEC;

                          color: Color(0xffE3EBEC),
                          image: AssetImage(home_indicator),
                        ),
                        Gap(23.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Healthy Taco Salad",
                              style: GoogleFonts.roboto(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Spacer(),
                            // border: 1.5px solid #748189
                            Image(
                              height: 20.h,
                              width: 20.w,
                              color: const Color(0xff748189),
                              image: const AssetImage(
                                timer_img,
                              ),
                            ),
                            Text(
                              "15 Min",
                              style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff748189),
                              ),
                            )
                          ],
                        ),
                        Gap(6.h),
                        // Text(
                        //   "This Healthy Taco Salad is the universal delight of taco night",
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 4,
                        // style: GoogleFonts.roboto(
                        //   fontSize: 16.sp,
                        //   fontWeight: FontWeight.w400,
                        //   height: 1.1,
                        // ),
                        // ),
                        RichText(
                          text: new TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(
                                text:
                                    'This Healthy Taco Salad is the universal delight of taco night',
                                style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1,
                                ),
                              ),
                              new TextSpan(
                                text: ' View More',
                                style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(16.h),
                        IngredientsGrid(),
                        Gap(24.h),
                        Container(
                          height: 54.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const CustomTabbar(),
                        ),
                        Gap(24.h),
                        const CustomRowWidget(
                          left: "Ingredients",
                          right: "Add All to Cart",
                          isaccountscreen: true,
                          isdetailspage: true,
                        ),
                        Gap(2.h),
                        Text(
                          "6 item",
                          style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: icon_color,
                          ),
                        ),
                        const CustomListTIle(
                            title: "Tortilla Chips", image: tortilla, count: 2),
                        const CustomListTIle(
                            title: "Avacado", image: avacado, count: 2),
                        const CustomListTIle(
                            title: "Red Cabbage", image: cabbage, count: 2),
                        const CustomListTIle(
                            title: "Peanuts", image: peanuts, count: 2),
                        const CustomListTIle(
                            title: "Red Onions", image: onion, count: 2),
                        Gap(24.h),
                        const CustomButton(
                            text: "Add To Cart", color: cyan_backg),
                        Gap(24.h),
                        const Divider(
                          thickness: 2,
                          endIndent: 10,
                          indent: 10,
                          color: Color(0xffEBF0F6),
                        ),
                        Gap(24.h),
                        const CustomRowWidget(
                          left: "Creator",
                          right: "",
                          isaccountscreen: true,
                        ),
                        Gap(12.h),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundColor: cyan_backg,
                              child: const Image(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(natalia_pic),
                              ),
                            ),
                            Gap(12.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Natalia Luca",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: black_text,
                                  ),
                                ),
                                Text(
                                  "I'm the author and recipe developer.",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: acc_role_color,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Gap(24.h),
                        const CustomRowWidget(
                          left: "Related Recipes",
                          right: "See All",
                          isaccountscreen: true,
                        ),
                        Gap(12.h),
                        PopularRecipes(
                          products: products,
                          isdetails: true,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 24.w,
                top: 56.h,
                child: HeartWidget(
                  isdetailspage: true,
                  color: black_text,
                  radius: 10.r,
                  img: love_img,
                ),
              ),
              Positioned(
                left: 24.w,
                top: 56.h,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: HeartWidget(
                    isdetailspage: true,
                    color: black_text,
                    radius: 10.r,
                    img: close_img,
                    iconsize: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// test

class IngredientsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: GridView.builder(
        shrinkWrap: true, // Makes the GridView fit its content
        physics:
            const NeverScrollableScrollPhysics(), // Prevents scrolling within the grid
        itemCount: ingredients.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          mainAxisSpacing: 16, // Vertical spacing
          crossAxisSpacing: 45, // Horizontal spacing
          childAspectRatio: 3.5, // Controls the width-to-height ratio
        ),
        itemBuilder: (context, index) {
          final ingredient = ingredients[index];
          return IngredientsWidget(
            image: ingredient['image']!,
            text: ingredient['text']!,
          );
        },
      ),
    );
  }
}

// Example ingredients list
final List<Map<String, String>> ingredients = [
  {'image': carbs, 'text': '65g carbs'},
  {'image': protien, 'text': '27g proteins'},
  {'image': caloreis_img, 'text': '120 Kcal'},
  {'image': fats, 'text': '91g fats'},
];

class IngredientsWidget extends StatelessWidget {
  final String image;
  final String text;

  const IngredientsWidget({
    required this.image,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              color: const Color(0xffE6EBF2),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image,
              color: black_text,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Gap(8.w),
        Text(text,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}

// edn test

class CustomListTIle extends StatelessWidget {
  final String title;
  final String image;
  final int count;
  const CustomListTIle(
      {super.key,
      required this.title,
      required this.image,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        height: 100.h,
        decoration: card_shadow,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      color: border_co, borderRadius: BorderRadius.circular(8)),
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
                Gap(16.h),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontSize: 18.sp, fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                const AnimatedOutlinedCounter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
