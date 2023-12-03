import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  MoodCubit() : super(const MoodState()) {
    _listenToChanges();
  }

  final _supabase = Supabase.instance.client;

  void _listenToChanges() {
    _supabase
        .channel('public:mood')
        .on(
            RealtimeListenTypes.postgresChanges,
            ChannelFilter(event: 'UPDATE', schema: 'public', table: 'images'),
            (payload, [ref]) => _readMood())
        .on(
            RealtimeListenTypes.postgresChanges,
            ChannelFilter(event: 'UPDATE', schema: 'public', table: 'videos'),
            (payload, [ref]) => _readMood())
        .subscribe();
  }

  Future<void> _readMood() async {
    final moodMap = await _supabase
        .from('current_mood')
        .select<Map<String, dynamic>?>()
        .limit(1)
        .maybeSingle();

    emit(
      MoodState(
        videoId: moodMap?['youtube_id'],
        imageUrl: moodMap?['image_url'],
      ),
    );
  }

  @override
  Future<void> close() async {
    _supabase.channel('public:mood').unsubscribe();
    super.close();
  }
}
