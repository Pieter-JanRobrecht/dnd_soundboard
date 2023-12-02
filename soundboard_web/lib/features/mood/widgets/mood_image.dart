import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_web/features/mood/mood.dart';

class MoodImage extends StatelessWidget {
  const MoodImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodCubit, MoodState>(
      buildWhen: (previous, current) => current is ShowImage,
      builder: (context, state) {
        if (state is! ShowImage) {
          return Container(
            color: Colors.transparent,
            width: MediaQuery.maybeOf(context)?.size.width,
            height: MediaQuery.maybeOf(context)?.size.height,
          );
        } else {
          return Container(
            color: Colors.white,
            width: MediaQuery.maybeOf(context)?.size.width,
            height: MediaQuery.maybeOf(context)?.size.height,
            child: Image.network(
              state.imageUrl,
              fit: BoxFit.fitHeight,
            ),
          );
        }
      },
    );
  }
}
