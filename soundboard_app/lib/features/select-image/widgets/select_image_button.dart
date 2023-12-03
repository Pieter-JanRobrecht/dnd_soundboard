import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_app/features/select-image/select_image.dart';
import 'package:soundboard_app/app/model/model.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({super.key, required this.image});

  final SoundboardImage image;

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
          context.read<SelectImageCubit>().changeCurrentShowing(image),
      child: Tooltip(
        message: image.description,
        child: Text(image.shortDescription),
      ),
    );
  }
}
