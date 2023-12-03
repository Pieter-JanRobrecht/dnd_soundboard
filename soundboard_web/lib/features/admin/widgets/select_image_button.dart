import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker_web/image_picker_web.dart';

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: 'imageBytes',
      builder: (state) {
        return ElevatedButton(
          onPressed: () async {
            Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
            state.didChange(bytesFromPicker);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.image),
              SizedBox(width: 8),
              Text('Choose image'),
            ],
          ),
        );
      },
    );
  }
}
