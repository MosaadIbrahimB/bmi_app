import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';
import '../../widget/text_form_field_widget.dart';

class CalcBMITab extends StatefulWidget {
  CalcBMITab({super.key});

  @override
  State<CalcBMITab> createState() => _CalcBMITabState();
}

class _CalcBMITabState extends State<CalcBMITab> {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController? wightController = TextEditingController();
  TextEditingController? heightController = TextEditingController();
  bool visible = false;
  String stringBmi = "x";
  String doubleBmi = "x";

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: keyForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormFieldWidget(
              title: "Enter your wight in KG ",
              keyboardType: TextInputType.number,
              validator: validator,
              controller: wightController,
            ),
            TextFormFieldWidget(
              title: "Enter your height in cm ",
              keyboardType: TextInputType.number,
              validator: validator,
              controller: heightController,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  bool result = keyForm.currentState!.validate();
                  if (result) {
                    Map<String, String> r = calcBmi(
                        stringWeight: wightController!.text,
                        stringHeight: heightController!.text);
                    doubleBmi = r["doubleBmi"]!;
                    stringBmi = r["stringBmi"]!;
                    provider.setDataCalcTab(
                        newWight: wightController?.text,
                        newHeight: heightController?.text,
                        newBmi: doubleBmi,
                        newClassification: stringBmi);
                    toast(doubleBmi);
                    toast(stringBmi);
                    setState(() {
                      visible = true;
                    });
                  }
                },
                child: const Text(
                  "CALCULATE BMI",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
            Visibility(
              visible: visible,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    stringBmi,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    doubleBmi,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> toast(String title){
    return   Fluttertoast.showToast(
        msg: stringBmi,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return "Enter Value";
    }
    return null;
  }

  Map<String, String> calcBmi(
      {required String stringWeight, required String stringHeight}) {
    String stringBmi = "";
    double weight = double.parse(stringWeight);
    double height = (double.parse(stringHeight)) / 100;
    double bmi = weight / (height * height);

    if (bmi < 18.5) {
      stringBmi = "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      stringBmi = "Optimum range";
    } else if (bmi >= 25 && bmi < 29.9) {
      stringBmi = "Overweight";
    } else {
      stringBmi = "obesity";
    }
    print(stringBmi);
    print(bmi);
    return {
      "stringBmi": stringBmi.toString() ?? "",
      "doubleBmi": bmi.toStringAsFixed(1) ?? "",
    };
  }
}

