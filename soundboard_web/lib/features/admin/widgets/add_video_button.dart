import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:soundboard_web/features/admin/admin.dart';

class AddVideoButton extends StatelessWidget {
  const AddVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddVideoDialog(context),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          SizedBox(width: 4),
          Icon(Icons.video_camera_back)
        ],
      ),
    );
  }

  void _showAddVideoDialog(BuildContext parent) {
    final formKey = GlobalKey<FormBuilderState>();

    showDialog(
      context: parent,
      builder: (BuildContext context) {
        return BlocProvider<AdminCubit>.value(
          value: parent.read<AdminCubit>(),
          child: FormBuilder(
            key: formKey,
            child: Dialog(
              child: Container(
                padding: const EdgeInsets.all(24),
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SoundboardTextField(
                      name: 'youtubeId',
                      hintText: 'Youtube ID',
                    ),
                    const SizedBox(height: 16),
                    SoundboardTextField(
                      name: 'shortDescription',
                      hintText: 'Short description',
                    ),
                    const SizedBox(height: 16),
                    SoundboardTextField(
                      name: 'description',
                      hintText: 'Description',
                      minLines: 3,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SubmitVideoButton(formKey: formKey),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => context.pop(),
                          child: const Text('Cancel'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
