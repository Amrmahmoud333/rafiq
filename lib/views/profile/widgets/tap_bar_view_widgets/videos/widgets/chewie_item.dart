import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ChewieItem extends StatefulWidget {
// This will contain the URL/asset path which we want to play
  final VideoPlayerController videoPlayerController;
  final bool? looping;

  const ChewieItem({
    required this.videoPlayerController,
    this.looping,
    Key? key,
  }) : super(key: key);
  @override
  State<ChewieItem> createState() => _ChewieItemState();
}

class _ChewieItemState extends State<ChewieItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16 / 9,
        // Prepare the video to be played and display the first frame
        autoInitialize: true,
        looping: widget.looping!,
        // Errors can occur for example when trying to play a video
        // from a non-existent URL
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.height * (n / 393);
    }

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffEFE7F2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(15), vertical: h(15)),
        child: SizedBox(
          width: w(321),
          height: h(167),
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
    print('=================disposed');
  }
}
