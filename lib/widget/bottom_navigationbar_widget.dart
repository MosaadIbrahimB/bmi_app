import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';
import '../share_value.dart';
class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget();

  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of(context);
    return Container(
      height: 70,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)),
      child: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        currentIndex: provider.currentIndex,
        selectedItemColor: Colors.blue,
        iconSize: 35,
        onTap: (index){
          provider.changeCurrentIndex(index);
        },
        items:  items,
      ),
    );
  }
}


