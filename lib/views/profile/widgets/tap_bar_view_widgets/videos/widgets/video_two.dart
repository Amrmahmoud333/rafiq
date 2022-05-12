import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({
    Key? key,
  }) : super(key: key);
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller =
        VideoPlayerController.network('https://www.fluttercampus.com/video.mp4')
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;
    return Column(
      children: [
        VideoPlayer(controller),
      ],
    );
  }
}
