import 'package:assets_audio_player/assets_audio_player.dart';

class AudioModel{
  String audioUrl;
  String trackName;
  AssetsAudioPlayer assetsAudioPlayer;
  String posterLink;
  AudioModel({this.assetsAudioPlayer,this.trackName,this.audioUrl,this.posterLink});
}