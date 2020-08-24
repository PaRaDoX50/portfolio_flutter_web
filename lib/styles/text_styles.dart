import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Returns the style for a page title based on the [deviceScreenType] passed in.
TextStyle titleTextStyle(DeviceScreenType deviceScreenType) {
  double titleSize = deviceScreenType == DeviceScreenType.mobile ? 30 : 50;
  return TextStyle(
      fontWeight: FontWeight.w800,  fontSize: titleSize);
}
TextStyle subTitleTextStyle(DeviceScreenType deviceScreenType) {
  double subTitleSize = deviceScreenType == DeviceScreenType.mobile ? 18 : 25;
  return TextStyle(
      fontWeight: FontWeight.w800,  fontSize: subTitleSize);
}

/// Return the style for description text on a page based on the [deviceScreenType] passed in.
TextStyle descriptionTextStyle(DeviceScreenType deviceScreenType) {
  double descriptionSize =
      deviceScreenType == DeviceScreenType.mobile ? 16 : 21;

  return TextStyle(
    fontSize: descriptionSize,
    height: 1.7,
  );
}
