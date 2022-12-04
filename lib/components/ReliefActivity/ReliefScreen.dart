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
      appBar: TOP_BARS.RELIEF,
      body:Container(
        color: AppColors.bg,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: VideoArea(data: data),
        ),
      ) 
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
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 30,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w800)),
      ),
      ReliefVideoPlayer(
          controller: _controller, autoplay: true, looping: false),
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
        decoration: BoxDecoration(
          gradient: AppGrads.mainGreen,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 1,
              color: AppColors.black.withOpacity(0.25)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: ElevatedButton(
              onPressed: () {
                function();
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
        ));
  }
}
