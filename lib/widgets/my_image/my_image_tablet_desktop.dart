import 'package:flutter/material.dart';
import 'package:the_basics/constants/app_colors.dart';

class MyImageTabletDesktop extends StatelessWidget {
  final String title;
  const MyImageTabletDesktop(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Image.asset("assets/images/placeholder_man.jpg"),

      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
