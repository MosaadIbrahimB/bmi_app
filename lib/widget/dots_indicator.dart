import 'package:flutter/material.dart';
class DotsIndicator extends StatelessWidget {
  int isSelect = 0;
  DotsIndicator({this.isSelect = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            3,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 10,
              width: isSelect == index ? 50 : 20,
              decoration: BoxDecoration(
                  color: isSelect == index ?Colors.green:Colors.orange,
                  borderRadius: BorderRadius.circular(20)),
              curve: Curves.easeIn,
              margin: const EdgeInsets.symmetric(horizontal: 2),
            )));
  }
}
