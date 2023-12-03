import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:soundboard_web/app/model/model.dart';

part 'admin_state.dart';

const tenYears = Duration(days: 365 * 10);

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  final _supabase = Supabase.instance.client;

  Future<void> insertVideo({
    required String youtubeId,
    required String shortDescription,
    String? description,
  }) async {
    final video = Video.fromUser(
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

    final image = Image.fromUser(
      imageUrl: signedUrl,
      shortDescription: shortDescription,
      description: description,
    );

    await _supabase.from('images').insert(image.toSupabase());
  }
}
