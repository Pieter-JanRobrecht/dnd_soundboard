part of 'mood_cubit.dart';

abstract class MoodState extends Equatable {
  const MoodState();
}

class MoodInitial extends MoodState {
  @override
  List<Object> get props => [];
}

class PlayVideo extends MoodState {
  const PlayVideo(this.videoId);

  final String videoId;

  @override
  List<Object?> get props => [videoId];
}

class ShowImage extends MoodState {
  const ShowImage(this.imageUrl);

  final String imageUrl;

  @override
  List<Object?> get props => [imageUrl];
}
