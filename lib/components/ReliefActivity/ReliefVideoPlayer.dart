import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:video_player/video_player.dart';

class ReliefVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  final bool? autoplay;
  final bool? looping;

  const ReliefVideoPlayer(
      {required this.controller, this.autoplay, this.looping, Key? key})
      : super(key: key);

  @override
  State<ReliefVideoPlayer> createState() => _ReliefVideoPlayerState();
}

class _ReliefVideoPlayerState extends State<ReliefVideoPlayer> {
  var chewieController;
  @override
  Widget build(BuildContext context) {
    chewieController = ChewieController(
      videoPlayerController: widget.controller,
      autoPlay: widget.autoplay ?? false,
      looping: widget.looping ?? false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: AppColors.white),
          ),
        );
      },
    );
    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
  }
}
