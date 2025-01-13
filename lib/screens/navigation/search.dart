import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/constants/const.dart';
import 'package:lascade_/providers/product_provider.dart';
import 'package:lascade_/widgets/black_forward_arrow.dart';
import 'package:lascade_/widgets/categories.dart';
import 'package:lascade_/widgets/circle_image_name.dart';
import 'package:lascade_/widgets/custom_row.dart';
import 'package:lascade_/widgets/popular_recipes.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          const CustomAppbar(),
          const CustomSearchBar(),
          Gap(16.h),
          const CategoryWidget(),
          Gap(24.h),
          const CustomRowWidget(left: "Popular Recipes", right: "View All"),
          Gap(12.h),
          PopularRecipes(
            products: provider.products,
          ),
          Gap(24.h),
          const CustomRowWidget(left: "Editor’s Choice", right: "View All"),
          Gap(12.h),
          EditorsChoiceWidget(
            products: provider.products,
          )
        ],
      ),
    );
  }
}

class EditorsChoiceWidget extends StatelessWidget {
  final List products;
  const EditorsChoiceWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: screenHeight * .70.h,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          separatorBuilder: (context, index) => Gap(8.h),
          itemBuilder: (context, index) {
            final title = products[index].title;
            final image = products[index].image;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Container(
                decoration: card_shadow,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r)),
                  color: white,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                      right: 16.w,
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image(
                            height: 84.h,
                            width: 100.w,
                            fit: BoxFit.cover,
                            image: NetworkImage(image),
                          ),
                        ),
                        Gap(16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(title,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: black_text,
                                  )),
                              Gap(8.h),
                              CircleImageNameWidget(
                                name: "James Spader",
                                index: index,
                              )
                            ],
                          ),
                        ),
                        Gap(8.w),
                        const BlackForwardArrow()
                      ],
                    ),
                  ),
                  // child:
                ),
              ),
            );
          }),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Logger().i("search screen build");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: border_co, width: 2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Image(
                height: 17.h,
                width: 17.w,
                color: black_text,
                image: const AssetImage(menu_search_unselected),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: unselected_nav,
                  ),
                  border: InputBorder.none, // Removes the default border
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final style_title = TextStyle(
      fontWeight: FontWeight.w700,
      color: black_text,
      fontSize: 24.sp,
    );
    return Padding(
      padding:
          EdgeInsets.only(top: 44.h, bottom: 26.h, left: 24.w, right: 24.w),
      child: Row(
        children: [
           Icon(
            Icons.arrow_back,
            size: 24.r,
          ),
          const Spacer(),
          Center(
            child: Text(
              "Search",
              style: style_title,
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
