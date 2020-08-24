import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/datamodels/audio_item_model.dart';
import 'package:the_basics/views/my_work/my_work_mobile.dart';

import 'my_work_tablet_desktop.dart';

class MyWork extends StatefulWidget {
  @override
  _MyWorkState createState() => _MyWorkState();
}

class _MyWorkState extends State<MyWork> {
  final assetAudioPlayer0 = AssetsAudioPlayer();
  final assetAudioPlayer1 = AssetsAudioPlayer();
  final assetAudioPlayer2 = AssetsAudioPlayer();



  @override
  Widget build(BuildContext context) {
    final List<AudioModel> audioModels = [
      AudioModel(
        assetsAudioPlayer: assetAudioPlayer0,
        posterLink:
        "https://firebasestorage.googleapis.com/v0/b/face-detection-b3b2e.appspot.com/o/500x500.jpg?alt=media&token=ddf2f476-dd07-495a-bffc-99c83fac0841",
        audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/portfolio-flutter-web-5d7d7.appspot.com/o/JJ%20JJ%20-%20Ajeeb%20Hai%20Ajeeb%20Mein%20(Lyric%20Video).mp3?alt=media&token=f14b093b-984f-4074-b13a-b0294bde1ee0",
        trackName: "JJ JJ - Ajeeb Mai Ajeeb Hai",
      ),
      AudioModel(
        assetsAudioPlayer: assetAudioPlayer1,
        posterLink:
        "https://firebasestorage.googleapis.com/v0/b/face-detection-b3b2e.appspot.com/o/500x500.jpg?alt=media&token=ddf2f476-dd07-495a-bffc-99c83fac0841",
        audioUrl:
        "https://firebasestorage.googleapis.com/v0/b/portfolio-flutter-web-5d7d7.appspot.com/o/No%20Feelings.mp3?alt=media&token=49ca09fc-6907-498d-9d92-3ffac5279610",
        trackName: "JJ JJ - No Feelings",
      ),

    ];
    return Provider(
      create: (_) => audioModels,
      child: ScreenTypeLayout(
        mobile: MyWorkMobile(),
        tablet: MyWorkTabletDesktop(),
        desktop: MyWorkTabletDesktop(),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();

  }
}
