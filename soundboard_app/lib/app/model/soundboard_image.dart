import 'package:equatable/equatable.dart';

class SoundboardImage extends Equatable {
  const SoundboardImage._({
    required this.imageUrl,
    required this.shortDescription,
    required this.isShowing,
    this.description,
  });

  factory SoundboardImage.fromSupabase(Map<String, dynamic> map) {
    return SoundboardImage._(
      imageUrl: map['image_url'] as String,
      shortDescription: map['short_description'] as String,
      isShowing: map['showing'] as bool,
      description: map['description'] as String?,
    );
  }

  final String imageUrl;
  final String shortDescription;
  final String? description;
  final bool isShowing;

  Map<String, dynamic> toMoodMap() => {
        'image_url': imageUrl,
      };

  @override
  List<Object?> get props => [
        imageUrl,
        shortDescription,
        description,
        isShowing,
      ];
}
