part of 'select_image_cubit.dart';

class SelectImageState extends Equatable {
  const SelectImageState(this.images);

  final List<Image> images;

  @override
  List<Object> get props => [images];
}
