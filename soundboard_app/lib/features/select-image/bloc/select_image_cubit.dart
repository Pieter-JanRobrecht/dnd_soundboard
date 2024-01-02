import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soundboard_app/app/model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'select_image_state.dart';

class SelectImageCubit extends Cubit<SelectImageState> {
  SelectImageCubit() : super(const SelectImageState([])) {
    loadImages();
  }

  final _supabase = Supabase.instance.client;

  Future<void> loadImages() async {
    final images = await _supabase
        .from('images')
        .select<List<Map<String, dynamic>>>()
        .eq('active', true);

    emit(SelectImageState(images.map(SoundboardImage.fromSupabase).toList()));
  }

  Future<void> changeCurrentShowing(SoundboardImage image) async {
    await _supabase
        .from('current_mood')
        .update(image.toMoodMap())
        .eq('index', '1');
  }
}
