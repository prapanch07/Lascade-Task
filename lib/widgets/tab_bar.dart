import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: 54, 
        padding:
            const EdgeInsets.all(4), 
        decoration: BoxDecoration(
          color:
              const Color(0xFFE8EDF5), 
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor:
              const Color(0xFF1F1F1F), 
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFF0B2C38), 
          ),
          tabs: const [
            Tab(
              child: SizedBox(
                height: 46, 
                child: Center(
                  child: Text('Ingredients'),
                ),
              ),
            ),
            Tab(
              child: SizedBox(
                height: 46, 
                child: Center(
                  child: Text('Instructions'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
