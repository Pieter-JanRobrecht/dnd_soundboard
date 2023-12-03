import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_app/app/model/model.dart';
import 'package:soundboard_app/features/select-video/select_video.dart';

class SelectVideoButton extends StatelessWidget {
  const SelectVideoButton({super.key, required this.video});

  final SoundboardVideo video;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
      ),
      onPressed: () =>
          context.read<SelectVideoCubit>().changeCurrentPlaying(video),
      child: Tooltip(
        message: video.description,
        child: Text(video.shortDescription),
      ),
    );
  }
}
