import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_app/features/select-image/select_image.dart';

class SelectImagePage extends StatelessWidget {
  const SelectImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectImageCubit>(
      create: (context) => SelectImageCubit(),
      child: BlocBuilder<SelectImageCubit, SelectImageState>(
          builder: (context, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: state.images.length,
          itemBuilder: (BuildContext context, int index) {
            final image = state.images[index];

            return ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                (states) =>
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              )),
              onPressed: () =>
                  context.read<SelectImageCubit>().changeCurrentShowing(image),
              child: Tooltip(
                message: image.description,
                child: Text(image.shortDescription),
              ),
            );
          },
        );
      }),
    );
  }
}
