import 'package:flutter/material.dart';
import 'package:the_basics/widgets/my_image/my_image.dart';
import 'package:the_basics/widgets/short_description/short_description.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ShortDescription(),
          SizedBox(
            height: 100,
          ),
          MyImage('Join Course'),
        ],
      ),
    );
  }
}
