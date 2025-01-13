import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/constants/const.dart';
import 'package:lascade_/providers/product_provider.dart';
import 'package:lascade_/screens/details_page.dart';
import 'package:lascade_/screens/shimmer_effect.dart';
import 'package:lascade_/widgets/categories.dart';
import 'package:lascade_/widgets/custom_row.dart';
import 'package:lascade_/widgets/heart_widget.dart';
import 'package:lascade_/widgets/icon_text.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    Logger().i("home screen build ");

    final style_title = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w800,
    );

    return provider.isLoading
        ? const HomeScreenShimmer()
        : provider.errorMessage.isNotEmpty
            ? Builder(
                builder: (context) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error ${provider.statuscode}'),
                          content: Text(provider.errorMessage),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  });
                  // Return an empty container or any widget to fulfill the build method's return type
                  return Container();
                },
              )
            : Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 24.w, right: 24.w, top: 56.h),
                        child: const CustomAppbarWidget(),
                      ),
                      Gap(24.h),
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, right: 24.w),
                        child: Text("Featured", style: style_title),
                      ),
                      Gap(12.h),
                      FeaturedCardCorousal(
                        title_value: provider.products,
                      ),
                      Gap(24.h),
                      const CustomRowWidget(left: "Category", right: "See All"),
                      Gap(12.h),
                      const CategoryWidget(),
                      Gap(24.h),
                      const CustomRowWidget(
                          left: "Popular Recipes", right: "See All"),
                      Gap(12.h),
                      PopulaRecipesCorousal(
                        products: provider.products,
                      ),
                    ],
                  ),
                ),
              );
  }
}

class PopulaRecipesCorousal extends StatelessWidget {
  final List products;
  const PopulaRecipesCorousal({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: screenHeight * 0.33,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          separatorBuilder: (context, index) => Gap(8.w),
          itemBuilder: (context, index) {
            final title = products[index].title;
            final image = products[index].image;

            return InkWell(
              onTap: () => _navigateToDetailsPage(context, image),
              child: Container(
                decoration: card_shadow,
                child: Card(
                  color: white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Container(
                    width: screenWidth * 0.6,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Image.network(
                                image,
                                height: screenHeight * 0.18,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 12.h,
                              right: 12.w,
                              child: HeartWidget(
                                color: black_text,
                                radius: 4.r,
                                img: love_img,
                              ),
                            ),
                          ],
                        ),
                        Gap(12.h),
                        Flexible(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: black_text,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Gap(20.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                  height: 16.h,
                                  width: 16.w,
                                  fit: BoxFit.cover,
                                  color: unselected_nav,
                                  image: const AssetImage(caloreis_img),
                                ),
                                Text(
                                  "120 Kcal",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 16.r,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "12 Min",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToDetailsPage(BuildContext context, image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(products: products, image: image),
      ),
    );
  }
}

class FeaturedCardCorousal extends StatelessWidget {
  final title_value;
  const FeaturedCardCorousal({super.key, required this.title_value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: 190.h,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: title_value.length,
          separatorBuilder: (context, index) => Gap(16.w),
          itemBuilder: (context, index) {
            final String title = title_value[index].title;
            return CustomCardWidget(title: title, img: profile_images[index]);
          },
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String img;
  const CustomCardWidget({super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: FontWeight.w400,
      color: white.withOpacity(.75),
      fontSize: 14.sp,
    );
    return Container(
      height: 172.h,
      width: 264.w,
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          alignment: AlignmentDirectional.topEnd,
          image: AssetImage(
            featured_back,
          ),
        ),
        color: cyan_backg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: white,
                fontSize: 18.sp,
              ),
            ),
            Gap(8.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 13.r,
                  backgroundImage: AssetImage(img),
                ),
                Gap(8.w),
                Text("James Spader", style: style),
                const Spacer(),
                //
                const IconTextWidget(icon: Icons.access_time, text: "20 Min")
                //
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(),
        Text(
          "Alena Sabyan",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: black_text,
            fontSize: 24.sp,
          ),
        )
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now().hour;
// final test_date = 14;
    Logger().d(date);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.wb_sunny_outlined,
          color: mng_icon,
          size: 22.r,
        ),
        Gap(3.w),
        Text(
          date <= 12 ? "Good Morning" : "Good Afternoon",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: black_text,
            fontSize: 14.sp,
          ),
        ),
        const Spacer(),
        Image(
          height: 24.h,
          width: 24.w,
          image: const AssetImage(cart_img),
        )
      ],
    );
  }
}
