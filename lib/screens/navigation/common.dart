import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/constants/const.dart';
import 'package:lascade_/providers/product_provider.dart';
import 'package:lascade_/screens/navigation/home.dart';
import 'package:lascade_/screens/navigation/account.dart';
import 'package:lascade_/screens/navigation/notification_.dart';
import 'package:lascade_/screens/navigation/search.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';

class CommonScreen extends StatefulWidget {
  const CommonScreen({super.key});

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Logger().i("common screen build");
    const screens = [
      HomeScreen(),
      SearchScreen(),
      NotificationScreen(),
      AccountScreen(),
    ];
    return Scaffold(
      body: screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Image(
          height: 24.h,
          width: 24.w,
          color: white,
          image: const AssetImage(chef),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r),
            topRight: Radius.circular(35.r),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 26.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: SizedBox(
                      height: 49.h,
                      width: 76.w,
                      // color: testcolor,
                      child: Center(
                        child: Image(
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.cover,
                          // color: Colors.black,
                          image: AssetImage(_currentIndex == 0
                              ? menu_home
                              : menu_home_unselected),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: SizedBox(
                      height: 49,
                      width: 76,
                      // color: cyan_backg,
                      child: Center(
                        child: Image(
                          height: 24.h,
                          width: 24.w,
                          image: AssetImage(_currentIndex == 1
                              ? menu_search
                              : menu_search_unselected),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 71), // Space for the floating button
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    child: SizedBox(
                      height: 49.h,
                      width: 76.w,
                      // color: testcolor,
                      child: Center(
                        child: Image(
                          height: 24.h,
                          width: 24.w,
                          color:
                              _currentIndex == 2 ? cyan_backg : unselected_nav,
                          image: const AssetImage(menu_notification),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                    child: SizedBox(
                      height: 49.h,
                      width: 76.w,
                      // color: cyan_backg,
                      child: Center(
                        child: Image(
                          height: 24.h,
                          width: 24.w,
                          image: AssetImage(_currentIndex == 3
                              ? menu_account
                              : menu_account_unselected),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(

      //   selectedItemColor: cyan_backg,
      //   unselectedItemColor: unselected_nav,

      //   items:const [
      //      BottomNavigationBarItem(

      //       icon:  Icon(
      //         Icons.home,
      //       ),
      //       label: "",
      //     ),
      //      BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
      //      BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications_none), label: ""),
      //      BottomNavigationBarItem(
      //         icon: Icon(Icons.account_box_rounded), label: ""),
      //   ],
      // ),
    );
  }
}
