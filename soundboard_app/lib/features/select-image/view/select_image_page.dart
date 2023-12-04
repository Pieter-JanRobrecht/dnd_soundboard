import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_app/features/select-image/select_image.dart';
import 'package:soundboard_app/features/select-image/widgets/select_image_button.dart';

class SelectImagePage extends StatelessWidget {
  const SelectImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectImageCubit>(
      create: (context) => SelectImageCubit(),
      child: BlocBuilder<SelectImageCubit, SelectImageState>(
          builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async => context.read<SelectImageCubit>().loadImages(),
          child: GridView.builder(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: state.images.length,
            itemBuilder: (BuildContext context, int index) {
              final image = state.images[index];

              return SelectImageButton(image: image);
            },
          ),
        );
      }),
    );
  }
}
