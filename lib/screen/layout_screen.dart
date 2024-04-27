import 'package:flutter/material.dart';
import 'package:health_app/provider/my_provider.dart';
import 'package:health_app/theme/theme.dart';
import 'package:provider/provider.dart';

import '../share_value.dart';
import '../widget/bottom_navigationbar_widget.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          items[provider.currentIndex].label??"",
          style: TSModel.appBarTitle,
        ),
      ),
      body: contentBody[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }

}






