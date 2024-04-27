import 'package:flutter/material.dart';
import 'package:health_app/provider/my_provider.dart';
import 'package:health_app/screen/layout_screen.dart';
import 'package:health_app/screen/splash_screen.dart';
import 'package:health_app/screen/tab/home_tab.dart';
import 'package:health_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>MyProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health App',
      theme: ThemeModel.themeL,
      home: LayoutScreen(),
    );
  }
}







