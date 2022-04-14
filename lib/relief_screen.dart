import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ReliefScreen extends StatelessWidget {

  final VideoData data;

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

  final VideoData data;
  final YoutubePlayerController _controller;

  VideoArea({Key? key, required this.data}) :
        _controller = YoutubePlayerController(
          initialVideoId: data.videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false
          )
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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


class VideoData {
  // Not sure if there is any more data we want to add about videos,
  // so I made this a class
  String videoId;
  VideoData({required this.videoId});
}
