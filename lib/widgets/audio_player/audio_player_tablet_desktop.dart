import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/styles/text_styles.dart';

class AudioPlayerTabletDesktop extends StatefulWidget {
  final String trackName;
  final String audioLink;
  final String posterLink;
  final AssetsAudioPlayer assetsAudioPlayer;
  int currentIndex;
  final int playerIndex;
  final Function onPlay;

  AudioPlayerTabletDesktop(
      {this.trackName,
      this.assetsAudioPlayer,
      this.audioLink,
      this.currentIndex,
      this.playerIndex,
      this.onPlay,
      this.posterLink});

  @override
  _AudioPlayerTabletDesktopState createState() =>
      _AudioPlayerTabletDesktopState();
}

class _AudioPlayerTabletDesktopState extends State<AudioPlayerTabletDesktop> {
  bool isStarted = false;
  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    if (widget.currentIndex != widget.playerIndex) {
      if (widget.assetsAudioPlayer.isPlaying.value) {
        widget.assetsAudioPlayer.pause();
        isPaused = true;
        setState(() {});
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8 / 2)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(widget.posterLink),
                    ),
                  ),
                  SizedBox(width: 32,),
                  Expanded(
                    child: Text(
                      widget.trackName,
                      style: subTitleTextStyle(DeviceScreenType.desktop),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipOval(
                    child: IconButton(
                      icon: !isStarted
                          ? Icon(Icons.play_arrow)
                          : (isPaused
                              ? Icon(Icons.play_arrow)
                              : Icon(Icons.pause)),
                      onPressed: onButtonPress,
                    ),
                  ),
                  StreamBuilder<Duration>(
                      stream: widget.assetsAudioPlayer.currentPosition,
                      builder: (context, snapshot) {
                        return Expanded(
                          child: Slider(
                            inactiveColor: Colors.grey,
                            activeColor: Colors.blueGrey,
                            onChanged: (x) {},
                            max: maxLength,
                            value: isStarted
                                ? snapshot.hasData ? snapshot.data.inSeconds : 0
                                : 0,
                          ),
                        );
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double get maxLength {
    return isPaused
        ? widget.assetsAudioPlayer.current.value.audio.duration.inSeconds
            .toDouble()
        : widget.assetsAudioPlayer.isPlaying.value
            ? widget.assetsAudioPlayer.current.value.audio.duration.inSeconds
                .toDouble()
            : 1;
  }

  onButtonPress() async {
    try {
      if (!isStarted) {
        widget.assetsAudioPlayer
            .open(
              Audio.network(
                widget.audioLink,
              ),
            )
            .then((value) => isStarted = true);

        widget.onPlay(widget.playerIndex);
        setState(() {});
      } else if (!isPaused && widget.assetsAudioPlayer.isPlaying.value) {
        widget.assetsAudioPlayer.pause();
        isPaused = true;

        setState(() {});
      } else {
        if (!widget.assetsAudioPlayer.isPlaying.value) {
          widget.assetsAudioPlayer.play();
          isPaused = false;
          widget.onPlay(widget.playerIndex);
          setState(() {});
        }
      }
    } catch (e) {
      // TODO
      print(e.toString());
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    widget.assetsAudioPlayer.pause();
    widget.assetsAudioPlayer.dispose();
  }
}
