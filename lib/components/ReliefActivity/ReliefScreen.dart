import 'package:flutter/material.dart';
import 'package:relieflink/components/ReliefActivity/ReliefRateScreen.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ReliefScreen extends StatelessWidget {

  final ReliefTechniqueData data;

  const ReliefScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:Top_Relief(), // Insert header here
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: VideoArea(data: data),
      ),
    );
  }
}

class VideoArea extends StatelessWidget {

  final ReliefTechniqueData data;
  final YoutubePlayerController _controller;

  VideoArea({Key? key, required this.data}):
        _controller = YoutubePlayerController(
          initialVideoId: data.videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false
          )
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(data.activityName, style: const TextStyle(color: Colors.orange, fontSize:30)),
      ),
      YoutubePlayer(controller:_controller),
      NextButton(data: data)
    ]);
  }
}

class NextButton extends StatelessWidget {
  final ReliefTechniqueData data;
  const NextButton({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(primary: Colors.white, backgroundColor: Colors.orange),
          child: Container(
            padding: EdgeInsets.all(20),
            child: const Text("Mark as Completed"),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ReliefRateScreen(data: data)));
          },
      ),
    );
  }
}