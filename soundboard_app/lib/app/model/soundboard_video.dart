import 'package:equatable/equatable.dart';

class SoundboardVideo extends Equatable {
  const SoundboardVideo._({
    required this.youtubeId,
    required this.shortDescription,
    required this.isPlaying,
    this.description,
  });

  factory SoundboardVideo.fromSupabase(Map<String, dynamic> map) {
    return SoundboardVideo._(
      youtubeId: map['youtube_id'] as String,
      shortDescription: map['short_description'] as String,
      isPlaying: map['playing'] as bool,
      description: map['description'] as String?,
    );
  }

  final String youtubeId;
  final String shortDescription;
  final String? description;
  final bool isPlaying;

  Map<String, dynamic> toMoodMap() => {
        'youtube_id': youtubeId,
      };

  @override
  List<Object?> get props => [
        youtubeId,
        shortDescription,
        description,
        isPlaying,
      ];
}
