import 'package:flutter/material.dart';
class ImageTextOnBorderWidget extends StatelessWidget {
  String title;
  String imagePath;
  ImageTextOnBorderWidget({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .80,
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .45,
            width: MediaQuery.of(context).size.width * .95,
            child: Image.asset(imagePath,fit: BoxFit.fill,),),
          const SizedBox(height: 15,),
          Text(
            title,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
