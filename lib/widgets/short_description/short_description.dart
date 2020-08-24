import 'package:flutter/material.dart';
//import 'package:flutter_app/styles/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/styles/text_styles.dart';

class ShortDescription extends StatelessWidget {
  const ShortDescription({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =TextAlign.left;

        return Container(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Jayendra Singh Tomar.',
                style: titleTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 16,
              ),Text(
                'Sound Mixer/Producer',
                style: subTitleTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Recording/mixing engineer specialised on cinematic, sound design-oriented and experimental music productions. Lecturer of Electronic Music and Sound Design at SAE Institute, London. Specialised in spatial audio, Sound Designer for AR/VR experience developers. Experimental Music and Sound Artist.',
                style: descriptionTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment,
              )
            ],
          ),
        );
      },
    );
  }
}
