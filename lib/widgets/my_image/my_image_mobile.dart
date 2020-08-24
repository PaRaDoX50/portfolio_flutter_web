import 'package:flutter/material.dart';
import 'package:the_basics/constants/app_colors.dart';

class MyImageMobile extends StatelessWidget {
  final String title;
  const MyImageMobile(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 60,
      alignment: Alignment.center,
      child: Image.asset("assets/images/placeholder_man.jpg"),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
