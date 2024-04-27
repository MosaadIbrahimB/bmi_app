import 'package:flutter/material.dart';
class TextFormFieldWidget extends StatelessWidget {
  String title;
  TextInputType? keyboardType;
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextFormFieldWidget({required this.title,this.keyboardType,this.controller,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        contentPadding:const EdgeInsets.symmetric(vertical: 13, horizontal:10),
        labelStyle: const TextStyle(fontSize: 20, color: Colors.grey),
        label: Text(title),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green)),
      ),
    );
  }

}
