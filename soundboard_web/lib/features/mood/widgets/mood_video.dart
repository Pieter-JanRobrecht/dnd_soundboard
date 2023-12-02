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
      listenWhen: (previous, current) => current is PlayVideo,
      listener: (context, state) =>
          _controller.loadVideoById(videoId: (state as PlayVideo).videoId),
      child: YoutubePlayer(
        controller: _controller,
      ),
    );
  }
}
