import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SoundboardTextField extends FormBuilderTextField {
  SoundboardTextField({
    required String hintText,
    required super.name,
    super.minLines,
    super.maxLines,
    super.key,
  }) : super(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Insert a value';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
        );
}
