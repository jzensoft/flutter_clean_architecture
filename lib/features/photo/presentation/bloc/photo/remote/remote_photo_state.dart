part of 'remote_photo_bloc.dart';

abstract class RemotePhotoState extends Equatable {
  final List<PhotoEntity>? photos;
  final Exception? error;

  const RemotePhotoState({this.photos, this.error});

  @override
  List<Object> get props => [photos!, error!];
}

class RemotePhotoLoading extends RemotePhotoState {
  const RemotePhotoLoading();
}

class RemotePhotoDone extends RemotePhotoState {
  const RemotePhotoDone(List<PhotoEntity> photo) : super(photos: photo);
}

class RemotePhotoError extends RemotePhotoState {
  const RemotePhotoError(Exception error) : super(error: error);
}
