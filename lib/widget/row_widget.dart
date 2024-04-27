import 'package:flutter/material.dart';
import 'package:health_app/widget/text_widget.dart';

class RowWidget extends StatelessWidget {
  String titleOne;
  String titleTwo;

  RowWidget({required this.titleOne,required this.titleTwo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(title: titleOne),
        TextWidget(title: titleTwo,color: Colors.grey,),
      ],
    );
  }
}
