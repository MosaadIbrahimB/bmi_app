import 'dart:async';
import 'package:flutter/material.dart';
import 'on_boreder_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double bottom = 0;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 50), () {
      setState(() {
        bottom = 300;
      });
    });
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => OnBorderScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "asset/image/splash.jpg",
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          AnimatedPositioned(
            bottom: bottom,
            left: 40,
            curve: Curves.easeIn,
            duration: const Duration(
              seconds: 3,
            ),
            child: Container(
              color: Colors.black26.withOpacity(.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFunc("Track"),
                  const SizedBox(height: 12),
                  textFunc("Your"),
                  const SizedBox(height: 12),
                  textFunc("Health"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  textFunc(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
