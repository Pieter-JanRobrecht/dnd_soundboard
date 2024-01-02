part of 'admin_cubit.dart';

sealed class AdminState extends Equatable {
  const AdminState({required this.images, required this.videos});

  final List<SoundboardImage> images;
  final List<SoundboardVideo> videos;

  @override
  List<Object?> get props => [images, videos];
}

class AdminInitial extends AdminState {
  const AdminInitial() : super(images: const [], videos: const []);
}

class AdminLoaded extends AdminState {
  const AdminLoaded({required super.images, required super.videos});
}
