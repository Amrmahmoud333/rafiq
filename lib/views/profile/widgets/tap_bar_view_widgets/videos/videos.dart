import 'package:flutter/material.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/videos/widgets/chewie_item.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatelessWidget {
  Videos({Key? key}) : super(key: key);

  final List<Widget> videos = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ChewieItem(
          videoPlayerController: VideoPlayerController.network(
              'https://www.fluttercampus.com/video.mp4'),
          looping: true,
        );
      },
      itemCount: 5,
    );
  }
}
