import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:soundboard_web/app/model/model.dart';

part 'admin_state.dart';

const tenYears = Duration(days: 365 * 10);

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(const AdminInitial());

  final _supabase = Supabase.instance.client;
  late final StreamSubscription<List<Map<String, dynamic>>> _imagesSubscription;
  late final StreamSubscription<List<Map<String, dynamic>>> _videosSubscription;

  Future<void> initialize() async {
    _imagesSubscription =
        _supabase.from('images').stream(primaryKey: ['image_url']).listen(
      (data) {
        final images = data.map(SoundboardImage.fromSupabase).toList();
        emit(AdminLoaded(images: images, videos: state.videos));
      },
    );

    _videosSubscription =
        _supabase.from('videos').stream(primaryKey: ['youtube_id']).listen(
      (data) {
        final videos = data.map(SoundboardVideo.fromSupabase).toList();
        emit(AdminLoaded(images: state.images, videos: videos));
      },
    );
  }

  Future<void> insertVideo({
    required String youtubeId,
    required String shortDescription,
    String? description,
  }) async {
    final video = SoundboardVideo.fromUser(
      youtubeId: youtubeId,
      shortDescription: shortDescription,
      description: description,
    );

    await _supabase.from('videos').insert(video.toSupabase());
  }

  Future<void> insertImage({
    required Uint8List imageBytes,
    required String imageName,
    required String shortDescription,
    String? description,
  }) async {
    await _supabase.storage
        .from('mood_images')
        .uploadBinary(imageName, imageBytes);

    final String signedUrl = await _supabase.storage
        .from('mood_images')
        .createSignedUrl(imageName, tenYears.inSeconds);

    final image = SoundboardImage.fromUser(
      imageUrl: signedUrl,
      shortDescription: shortDescription,
      description: description,
    );

    await _supabase.from('images').insert(image.toSupabase());
  }

  Future<void> updateImage({
    required SoundboardImage image,
    bool? isActive,
  }) async {
    final updatedImage = SoundboardImage.withActive(image, isActive);
    return _supabase
        .from('images')
        .update(updatedImage.toSupabase())
        .match({'image_url': updatedImage.imageUrl});
  }

  Future<void> updateVideo({
    required SoundboardVideo video,
    bool? isActive,
  }) async {
    final updatedVideo = SoundboardVideo.withActive(video, isActive);
    return _supabase
        .from('videos')
        .update(updatedVideo.toSupabase())
        .match({'youtube_id': updatedVideo.youtubeId});
  }

  @override
  Future<void> close() async {
    _imagesSubscription.cancel();
    _videosSubscription.cancel();
    super.close();
  }
}
