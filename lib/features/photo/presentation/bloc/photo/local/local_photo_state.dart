part of 'local_photo_bloc.dart';

abstract class LocalPhotoState extends Equatable {
  final List<PhotoEntity>? photos;

  const LocalPhotoState({this.photos});

  @override
  List<Object> get props => [photos!];
}

class LocalPhotoLoading extends LocalPhotoState {}

class LocalPhotoDone extends LocalPhotoState {
  const LocalPhotoDone(List<PhotoEntity> data) : super(photos: data);
}
