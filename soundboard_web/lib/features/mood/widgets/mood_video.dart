import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_web/features/mood/mood.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MoodVideo extends StatelessWidget {
  MoodVideo({super.key});

  final _controller = YoutubePlayerController(
    params: const YoutubePlayerParams(loop: true),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<MoodCubit, MoodState>(
      listenWhen: (previous, current) => previous.videoId != current.videoId,
      listener: (context, state) {
        if (state.videoId == null) {
          _controller.stopVideo();
        } else {
          _controller.loadVideoById(videoId: state.videoId!);
        }
      },
      child: YoutubePlayer(
        controller: _controller,
      ),
    );
  }
}
