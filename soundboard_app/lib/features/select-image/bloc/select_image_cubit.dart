import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soundboard_app/app/model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'select_image_state.dart';

class SelectImageCubit extends Cubit<SelectImageState> {
  SelectImageCubit() : super(const SelectImageState([])) {
    _loadImages();
  }

  final _supabase = Supabase.instance.client;

  Future<void> _loadImages() async {
    final images =
        await _supabase.from('images').select<List<Map<String, dynamic>>>();

    emit(SelectImageState(images.map(Image.fromSupabase).toList()));
  }

  Future<void> changeCurrentShowing(Image image) async {
    await _supabase.from('current_mood').update(image.toMoodMap());
  }
}
