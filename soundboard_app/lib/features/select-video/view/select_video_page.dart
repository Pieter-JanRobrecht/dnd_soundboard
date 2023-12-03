import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_app/features/select-video/select_video.dart';

class SelectVideoPage extends StatelessWidget {
  const SelectVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectVideoCubit>(
      create: (context) => SelectVideoCubit(),
      child: BlocBuilder<SelectVideoCubit, SelectVideoState>(
          builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: state.videos.length,
          itemBuilder: (BuildContext context, int index) {
            final video = state.videos[index];

            return SelectVideoButton(video: video);
          },
        );
      }),
    );
  }
}
