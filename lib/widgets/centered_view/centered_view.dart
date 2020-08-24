import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CenteredView extends StatelessWidget {
  final Widget child;

  const CenteredView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Container(
        padding: EdgeInsets.only(
            left:
                sizeInfo.deviceScreenType == DeviceScreenType.mobile ? 16 : 32,
            right:
                sizeInfo.deviceScreenType == DeviceScreenType.mobile ? 16 : 32,
            top:
                sizeInfo.deviceScreenType == DeviceScreenType.mobile ? 8 : 70),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      );
    });
  }
}
