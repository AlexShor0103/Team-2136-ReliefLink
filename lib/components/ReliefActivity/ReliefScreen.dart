import 'package:flutter/material.dart';
import 'package:relieflink/components/ReliefActivity/ReliefRateScreen.dart';
import 'package:relieflink/components/ReliefActivity/ReliefVideoPlayer.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import 'package:video_player/video_player.dart';
import 'package:relieflink/utils/constants.dart';

// this class is responsible for holding the video for the current relief technique
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

// This is where the video is played
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
      ReliefVideoPlayer(
          controller: _controller, autoplay: true, looping: false),
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
      decoration: BoxDecoration(
        gradient: AppGrads.mainGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReliefRateScreen(data: data)));
          },
          child: const Text("Mark As Completed",
            style: TextStyle(
              color: AppColors.font,
              fontFamily: 'MainFont',
              fontWeight: FontWeight.w800,
              fontSize: 20,
            )),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          )
        ),
      ) 
    );
  }
}
