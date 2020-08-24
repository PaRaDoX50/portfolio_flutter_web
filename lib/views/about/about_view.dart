import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        ''' Recording/mixing engineer specialised on cinematic, sound design-oriented and experimental music productions. Lecturer of Electronic Music and Sound Design at SAE Institute, London. Specialised in spatial audio, Sound Designer for AR/VR experience developers. Experimental Music and Sound Artist.

My name is Christian Duka and I am a multi-skilled sound engineer/music producer, sound designer and music artist. Currently based in London, my work focuses on mixing/mastering engineering, sound design/art, curation and art direction.

I take on board music production projects characterised by a strong artistic personality, entailing a certain degree of experimentalism and forward-looking vision - I am especially interested in cross-over of seemingly opposite genres.

My strength is the ability to understand the essential musical personalities of my clients and the capacity to translate them in the productions through creative sound design, mixing and mastering.

My work as a sound designer/music artist focuses on translating concepts and emotions in sonic form. Clients in this field span from VR/VR experience developers to film producers, game developers and brands. My strength comes from 7 years of experience in sound paired with research on the translation of emotional/psychological traits into music/sound.

Lately, I have specialised in spatial, 3D audio practices at MONOM, Berlin and Aures, London - two of the three permanent 3D sound system existing in Europe. This allows me to offer additional services such as binaural spatialisation of monophonic content (contact for pricing)''',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
