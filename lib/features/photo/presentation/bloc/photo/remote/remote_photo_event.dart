part of 'remote_photo_bloc.dart';

abstract class RemotePhotoEvent extends Equatable {
  const RemotePhotoEvent();

  @override
  List<Object?> get props => [];
}

class GetPhotos extends RemotePhotoEvent {}
