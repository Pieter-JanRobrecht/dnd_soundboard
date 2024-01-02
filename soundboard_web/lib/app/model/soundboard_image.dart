import 'package:equatable/equatable.dart';

class SoundboardImage extends Equatable {
  const SoundboardImage._({
    required this.imageUrl,
    required this.shortDescription,
    required this.isShowing,
    required this.isActive,
    this.description,
  });

  const SoundboardImage.fromUser({
    required this.imageUrl,
    required this.shortDescription,
    this.description,
  })
      : isShowing = false,
        isActive = true;

  factory SoundboardImage.fromSupabase(Map<String, dynamic> map) {
    return SoundboardImage._(
      imageUrl: map['image_url'] as String,
      shortDescription: map['short_description'] as String,
      isShowing: map['showing'] as bool,
      isActive: map['active'] as bool,
      description: map['description'] as String?,
    );
  }

  factory SoundboardImage.withActive(SoundboardImage image, bool? isActive){
    return SoundboardImage._(
      imageUrl: image.imageUrl,
      shortDescription: image.shortDescription,
      description: image.description,
      isShowing: image.isShowing,
      isActive: isActive ?? image.isActive,
    );
  }

  final String imageUrl;
  final String shortDescription;
  final String? description;
  final bool isShowing;
  final bool isActive;

  Map<String, dynamic> toSupabase() =>
      {
        'image_url': imageUrl,
        'short_description': shortDescription,
        'description': description,
        'active': isActive,
      };

  @override
  List<Object?> get props =>
      [
        imageUrl,
        shortDescription,
        description,
        isShowing,
        isActive,
      ];
}
