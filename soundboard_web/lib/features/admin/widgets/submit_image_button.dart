import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:soundboard_web/features/admin/admin.dart';

class SubmitImageButton extends StatelessWidget {
  const SubmitImageButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        var state = formKey.currentState;
        if (state?.saveAndValidate() == true) {
          context.read<AdminCubit>().insertImage(
                imageBytes: state!.value['imageBytes'] as Uint8List,
                imageName: state.value['imageName'] as String,
                shortDescription: state.value['shortDescription'] as String,
                description: state.value['description'] as String,
              );
          context.pop();
        }
      },
      child: const Text('Submit'),
    );
  }
}
