import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:the_basics/extensions/hover_extensions.dart';
import 'package:the_basics/widgets/my_image/my_image_mobile.dart';
import 'package:the_basics/widgets/my_image/my_image_tablet_desktop.dart';

class MyImage extends StatelessWidget {
  final String title;
  MyImage(this.title);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MyImageMobile(title),
      tablet: MyImageTabletDesktop(title),
    ).showCursorOnHover.moveUpOnHover;
  }
}
