import 'package:flutter/material.dart';
import 'package:soundboard_web/features/mood/mood.dart';

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        MoodVideo(),
        MoodImage(),
      ],
    );
  }
}
