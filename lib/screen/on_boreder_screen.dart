import 'package:flutter/material.dart';

import '../widget/dots_indicator.dart';
import '../widget/image_text_onborder_widget.dart';
import 'layout_screen.dart';

class OnBorderScreen extends StatefulWidget {
  OnBorderScreen({super.key});

  @override
  State<OnBorderScreen> createState() => _OnBorderScreenState();
}

class _OnBorderScreenState extends State<OnBorderScreen> {
  int currentIndex = 0;
  PageController? controller = PageController(initialPage: 0);
  List<Widget> content = [
    ImageTextOnBorderWidget(
      title: "Welcome to health App",
      imagePath: "asset/image/1.png",
    ),
    ImageTextOnBorderWidget(
      title: "Health App is best to life ",
      imagePath: "asset/image/2.png",
    ),
    ImageTextOnBorderWidget(
      title: "App is prefect to performance health",
      imagePath: "asset/image/3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: height * .2,
            ),
            Expanded(
              child: PageView(
                controller: controller,
                children: content,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotsIndicator(isSelect: currentIndex),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        setState(() {
                          if (currentIndex == content.length - 1) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => LayoutScreen()));
                          } else {
                            controller?.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);

                            setState(() {
                              currentIndex++;
                            });
                          }
                        });
                      },
                      child: Text(
                        currentIndex == content.length - 1 ? "FINISH" : "NEXT",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}
