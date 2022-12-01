import 'package:flutter/material.dart';
import 'package:relieflink/components/ReliefActivity/ReliefRateScreen.dart';
import 'package:relieflink/components/ReliefActivity/ReliefVideoPlayer.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import 'package:video_player/video_player.dart';

// this class is responsible for holding the video for the current relief technique
class ReliefScreen extends StatelessWidget {
  final ReliefTechniqueData data;

  const ReliefScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Top_Relief(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: VideoArea(data: data),
      ),
    );
  }
}

// This is where the video is played
class VideoArea extends StatefulWidget {
  final ReliefTechniqueData data;

  VideoArea({Key? key, required this.data}) : super(key: key);

  @override
  State<VideoArea> createState() => _VideoAreaState();
}

class _VideoAreaState extends State<VideoArea> {
  late final VideoPlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = VideoPlayerController.network(widget.data.videoLink);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(widget.data.activityName,
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
      NextButton(
          data: widget.data,
          function: () {
            _controller.pause();
          })
    ]);
  }
}

class NextButton extends StatelessWidget {
  final ReliefTechniqueData data;
  final Function function;
  const NextButton({Key? key, required this.data, required this.function})
      : super(key: key);

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
          function();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReliefRateScreen(data: data)));
        },
      ),
    );
  }
}
