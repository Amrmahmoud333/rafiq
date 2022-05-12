import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  VideoPlayerWidget({Key? key, required this.controller}) : super(key: key);
  VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    return controller != null && controller!.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: VideoPlayer(controller!));
}
