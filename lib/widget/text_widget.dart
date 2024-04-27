import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String title;
  Color ? color;

  TextWidget({required this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color:color ),
    );
  }
}
