import 'package:flutter/material.dart';
import 'package:relieflink/components/ReliefActivity/ReliefRateScreen.dart';
import 'package:relieflink/components/ReliefActivity/ReliefVideoPlayer.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import 'package:video_player/video_player.dart';

class ReliefScreen extends StatelessWidget {
  final ReliefTechniqueData data;

  const ReliefScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Top_Relief(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: VideoArea(data: data),
      ),
    );
  }
}

class VideoArea extends StatelessWidget {
  final ReliefTechniqueData data;
  final VideoPlayerController _controller;

  VideoArea({Key? key, required this.data})
      : _controller = VideoPlayerController.network(data.videoLink),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(data.activityName,
            style: const TextStyle(color: Colors.orange, fontSize: 30)),
      ),
      Expanded(
        child: Container(),
      ),
      ReliefVideoPlayer(
          controller: _controller, autoplay: true, looping: false),
      Expanded(
        child: Container(),
      ),
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
        style: OutlinedButton.styleFrom(
            primary: Colors.white, backgroundColor: Colors.orange),
        child: Container(
          padding: EdgeInsets.all(20),
          child: const Text("Mark as Completed"),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReliefRateScreen(data: data)));
        },
      ),
    );
  }
}
