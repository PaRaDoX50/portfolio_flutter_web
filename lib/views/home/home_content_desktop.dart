import 'package:flutter/material.dart';
import 'package:the_basics/widgets/my_image/my_image.dart';
import 'package:the_basics/widgets/short_description/short_description.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[
          ShortDescription(),
          Expanded(
            child: Center(
              child: MyImage('Join Course'),
            ),
          )
        ],
      ),
    );
  }
}
