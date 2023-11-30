import 'package:flutter/material.dart';

class MoodImage extends StatelessWidget {
  const MoodImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://picsum.photos/250?image=9',
    );
  }
}
