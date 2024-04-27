
import 'package:flutter/material.dart';
import 'package:health_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

import '../../model/profile_data_model.dart';
import '../../widget/row_widget.dart';

class ProfileTab extends StatelessWidget {

   ProfileTab({super.key});
  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowWidget(titleOne: "Name",titleTwo: provider.name??"",),
          RowWidget(titleOne: "Age",titleTwo: provider.age??"",),
          RowWidget(titleOne: "Wight",titleTwo: provider.wight??"",),
          RowWidget(titleOne: "Height",titleTwo: provider.height??"",),
          RowWidget(titleOne: "Gender",titleTwo: provider.gender??"",),
          RowWidget(titleOne: "Bmi",titleTwo: provider.bmi??"",),
          RowWidget(titleOne: "Classification",titleTwo: provider.classification??"",),
        ],
      ),
    );
  }
}








