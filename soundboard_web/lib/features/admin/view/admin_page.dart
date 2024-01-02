import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundboard_web/app/app.dart';
import 'package:soundboard_web/features/admin/admin.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCubit()..initialize(),
      child: Scaffold(
        floatingActionButton: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AddImageButton(),
            SizedBox(height: 16),
            AddVideoButton(),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(title: Text('Images')),
            BlocSelector<AdminCubit, AdminState, List<SoundboardImage>>(
              selector: (state) => state.images,
              builder: (context, state) {
                return SliverList.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final image = state[index];
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(image.shortDescription),
                      subtitle: Text(image.imageUrl),
                      value: image.isActive,
                      onChanged: (bool? value) => context
                          .read<AdminCubit>()
                          .updateImage(image: image, isActive: value),
                    );
                  },
                );
              },
            ),
            const SliverAppBar(title: Text('Videos')),
            BlocSelector<AdminCubit, AdminState, List<SoundboardVideo>>(
              selector: (state) => state.videos,
              builder: (context, state) {
                return SliverList.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final video = state[index];
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(video.shortDescription),
                      subtitle: Text(video.youtubeId),
                      value: video.isActive,
                      onChanged: (bool? value) => context
                          .read<AdminCubit>()
                          .updateVideo(video: video, isActive: value),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
