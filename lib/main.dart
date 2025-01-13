import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lascade_/constants/colors.dart';
import 'package:lascade_/providers/product_provider.dart';
import 'package:lascade_/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: ScreenUtilInit(
        designSize: const Size(412, 892),
        builder:(context, child) =>  MaterialApp(
          title: 'lascade task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Sofia-Pro",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
            scaffoldBackgroundColor: white,
            appBarTheme: const AppBarTheme(
              backgroundColor: white
            )
          ),
          home:   const LoginScreen(),
        ),
      ),
    );
  }
}
