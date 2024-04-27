import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  int currentIndex=0;

  changeCurrentIndex(int newIndex){
    currentIndex=newIndex;
    notifyListeners();
  }

  String? name;
  String? age;
  String? wight;
  String? height;
  String? gender;
  String? bmi;
  String? classification;

  setDataHomeTab({
    String? newName,
    String? newAge,
    String? newGender,
  }) {
    name = newName;
    age = newAge;

    gender = newGender;

    notifyListeners();
  }

  setDataCalcTab({
    String? newWight,
    String? newHeight,
    String? newBmi,
    String? newClassification,
  }) {
    wight = newWight;
    height = newHeight;
    bmi = newBmi;
    classification=newClassification;
    notifyListeners();
  }
}
