import 'package:flutter/material.dart';
import 'package:health_app/screen/tab/calc_bmi_tab.dart';
import 'package:health_app/screen/tab/home_tab.dart';
import 'package:health_app/screen/tab/profile_tab.dart';

List<Widget> contentBody=[HomeTab(),CalcBMITab(),ProfileTab()];

List<BottomNavigationBarItem> items= const[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  BottomNavigationBarItem(
      icon: Icon(Icons.calculate), label: "Calculate BMI"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
];


