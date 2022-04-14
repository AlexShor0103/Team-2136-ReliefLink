import 'package:flutter/material.dart';
import 'package:relieflink/relief_technique_utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ReliefScreen extends StatelessWidget {

  final ReliefTechniqueData data;

  const ReliefScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("HEADER HERE")), // Insert header here
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: VideoArea(data: data),
      ),
      bottomNavigationBar: const Text("NAVIGATION BAR HERE"), // Insert navigation bar here
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
      Text(data.activityName, style: const TextStyle(color: Colors.orange, fontSize:30)),
      YoutubePlayer(controller:_controller),
      const NextButton()
    ]);
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(primary: Colors.white, backgroundColor: Colors.orange),
        child: const Text("Mark as Completed"),
        onPressed: () {
          print("Marked as Complete");
        },
    );
  }
}