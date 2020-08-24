import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_basics/datamodels/audio_item_model.dart';
import 'package:the_basics/widgets/audio_player/audio_player_tablet_desktop.dart';


class MyWorkTabletDesktop extends StatefulWidget {
  @override
  _MyWorkTabletDesktopState createState() => _MyWorkTabletDesktopState();
}

class _MyWorkTabletDesktopState  extends State<MyWorkTabletDesktop> {

  int currentIndex = -1;

  onPlay(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context,) {
//    print(info.audio.first.url.toString());
//  Provider<List<AudioModel>>.of(context);

    return SingleChildScrollView(
      child: Consumer<List<AudioModel>>(
        builder: (_,models,__){return Column(
          children: [
            AudioPlayerTabletDesktop(posterLink: models[0].posterLink,
              assetsAudioPlayer: models[0].assetsAudioPlayer,
              audioLink:models[0].audioUrl,
              trackName: models[0].trackName,
              currentIndex: currentIndex,
              onPlay: onPlay,
              playerIndex: 0,
            ),
            AudioPlayerTabletDesktop(
              posterLink: models[1].posterLink,
              assetsAudioPlayer: models[1].assetsAudioPlayer,
              audioLink:models[1].audioUrl,
              trackName: models[1].trackName,
              currentIndex: currentIndex,
              onPlay: onPlay,
              playerIndex: 1,
            ),

          ],
        );},
      ),
    );
  }

}
