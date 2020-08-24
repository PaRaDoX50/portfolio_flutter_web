import 'package:flutter/material.dart';
import 'package:the_basics/routing/route_names.dart';
import 'package:the_basics/widgets/navbar_item/navbar_item.dart';


class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("JJ JJ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Home', HomeRoute),
              SizedBox(
                width: 60,
              ),

              NavBarItem('My Work', MyWorkRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('About', AboutRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem('Contact Me', ContactMeRoute),


            ],
          )
        ],
      ),
    );
  }
}
