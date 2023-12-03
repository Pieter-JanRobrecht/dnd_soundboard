part of 'select_video_cubit.dart';

class SelectVideoState extends Equatable {
  const SelectVideoState(this.videos);

  final List<SoundboardVideo> videos;

  @override
  List<Object> get props => [videos];
}
