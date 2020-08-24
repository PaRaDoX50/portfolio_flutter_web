import 'package:flutter/material.dart';
import 'package:the_basics/constants/app_colors.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.black87,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'JJ JJ',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white),
          ),

        ],
      ),
    );
  }
}
