part of 'mood_cubit.dart';

class MoodState extends Equatable {
  const MoodState({this.videoId, this.imageUrl});

  final String? videoId;
  final String? imageUrl;

  @override
  List<Object?> get props => [videoId, imageUrl];
}
