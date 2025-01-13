import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/constants/const.dart';
import 'package:lascade_/providers/product_provider.dart';
import 'package:lascade_/screens/navigation/home.dart';
import 'package:lascade_/widgets/circle_image_name.dart';
import 'package:lascade_/widgets/custom_row.dart';
import 'package:lascade_/widgets/heart_widget.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.w, right: 24.w, top: 26.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const CustomAppbar(),
              Gap(26.h),
              const AccountDetails(),
              Gap(24.h),
              const CustomRowWidget(
                left: "My Favorites",
                right: "See All",
                isaccountscreen: true,
              ),
              MyFavorites(
                products: provider.products,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyFavorites extends StatelessWidget {
  final List products;
  const MyFavorites({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: screenHeight * .95.h,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 156 / 198,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final title = products[index].title;
          final image = products[index].image;
          return Container(
            decoration: card_shadow,
            child: Card(
              elevation: 0,
              color: white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Stack(
                        children: [
                          Image(
                            width: 132.w,
                            height: 88.h,
                            fit: BoxFit.cover,
                            image: NetworkImage(image),
                          ),
                          Positioned(
                            top: 10.h,
                            right: 10.w,
                            child: HeartWidget(
                              color: cyan_backg,
                              radius: 10.r,
                              img: love_cyan,
                            ),
                          )
                        ],
                      ),
                    ),
                    Gap(12.h),
                    Text(
                      title,
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    // Gap(10.h),
                    const Spacer(),
                    CircleImageNameWidget(
                      name: "Alice Fala",
                      index: index,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: card_shadow,
      child: Card(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        color: white,
        child: ListTile(
          leading: CircleAvatar(
            radius: 24.r,
            backgroundImage: const AssetImage(profile_pic),
          ),
          title: Text("Alena Sabyan",
              style: TextStyle(
                  color: black_text,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800)),
          subtitle: Text(
            "Recipe Developer",
            style: TextStyle(
              color: acc_role_color,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          trailing: Container(
            height: 28.h,
            width: 28.w,
            decoration: BoxDecoration(
              color: black_text,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: white,
              size: 16.r,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Row(
        children: [
          Text(
            "Account",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24.sp,
            ),
          ),
          const Spacer(),
          const Icon(Icons.settings_outlined)
        ],
      ),
    );
  }
}
