import 'package:flutter/material.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/videos/widgets/chewie_item.dart';
import 'package:rafiq/views/profile/widgets/tap_bar_view_widgets/videos/widgets/video_two.dart';
import 'package:video_player/video_player.dart';

class Videos extends StatelessWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const SizedBox(
          width: 200,
          height: 200,
          child: Video(),
        );
      },
      itemCount: 1,
    );
  }
}

// ChewieItem(
//           key: Key("${index.hashCode}_key"),
//           videoPlayerController: VideoPlayerController.network(
//               'https://www.fluttercampus.com/video.mp4'),
//           looping: true,
//         );