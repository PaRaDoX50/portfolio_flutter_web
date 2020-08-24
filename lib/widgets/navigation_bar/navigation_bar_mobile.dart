import 'package:flutter/material.dart';
import 'package:the_basics/views/layout_template/layout_template.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              LayoutTemplate.scaffoldKey.currentState.openDrawer();
            },
          ),
          Text("JJ JJ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        ],
      ),
    );
  }
}
