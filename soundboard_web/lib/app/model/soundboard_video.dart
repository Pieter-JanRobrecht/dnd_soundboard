import 'package:equatable/equatable.dart';

class SoundboardVideo extends Equatable {
  const SoundboardVideo._({
    required this.youtubeId,
    required this.shortDescription,
    required this.isPlaying,
    required this.isActive,
    this.description,
  });

  const SoundboardVideo.fromUser({
    required this.youtubeId,
    required this.shortDescription,
    this.description,
  })  : isPlaying = false,
        isActive = true;

  factory SoundboardVideo.fromSupabase(Map<String, dynamic> map) {
    return SoundboardVideo._(
      youtubeId: map['youtube_id'] as String,
      shortDescription: map['short_description'] as String,
      isPlaying: map['playing'] as bool,
      isActive: map['active'] as bool,
      description: map['description'] as String?,
    );
  }

  factory SoundboardVideo.withActive(SoundboardVideo video, bool? isActive) {
    return SoundboardVideo._(
      youtubeId: video.youtubeId,
      shortDescription: video.shortDescription,
      description: video.description,
      isPlaying: video.isPlaying,
      isActive: isActive ?? video.isActive,
    );
  }

  final String youtubeId;
  final String shortDescription;
  final String? description;
  final bool isPlaying;
  final bool isActive;

  Map<String, dynamic> toSupabase() => {
        'youtube_id': youtubeId,
        'short_description': shortDescription,
        'description': description,
        'active': isActive,
      };

  @override
  List<Object?> get props => [
        youtubeId,
        shortDescription,
        description,
        isPlaying,
        isActive,
      ];
}
