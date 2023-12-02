import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_web/features/mood/mood.dart';

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoodCubit>(
      create: (context) => MoodCubit(),
      child: Stack(
        children: [
          MoodVideo(),
          const MoodImage(),
        ],
      ),
    );
  }
}
