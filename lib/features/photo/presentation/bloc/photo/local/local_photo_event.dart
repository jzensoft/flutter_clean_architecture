part of 'local_photo_bloc.dart';

abstract class LocalPhotoEvent extends Equatable {
  final PhotoEntity? photoEntity;

  const LocalPhotoEvent({this.photoEntity});

  @override
  List<Object?> get props => [photoEntity!];
}

class GetSavedPhoto extends LocalPhotoEvent {}

class RemovePhoto extends LocalPhotoEvent {
  const RemovePhoto(PhotoEntity data) : super(photoEntity: data);
}

class SavePhoto extends LocalPhotoEvent {
  const SavePhoto(PhotoEntity data) : super(photoEntity: data);
}
