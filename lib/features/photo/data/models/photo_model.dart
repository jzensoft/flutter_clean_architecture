import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'photo', primaryKeys: ['id'])
class PhotoModel extends PhotoEntity {
  const PhotoModel(
      {required super.albumId,
      required super.id,
      required super.title,
      required super.url,
      required super.thumbnailUrl});

  factory PhotoModel.fromJson(Map<String, dynamic> map) {
    return PhotoModel(
        albumId: map['albumId'] ?? 0,
        id: map['id'] ?? 0,
        title: map['title'] ?? "",
        url: map['url'] ?? "",
        thumbnailUrl: map['thumbnailUrl'] ?? "");
  }

  factory PhotoModel.fromEntity(PhotoEntity entity) {
    return PhotoModel(
        albumId: entity.albumId,
        id: entity.id,
        title: entity.title,
        url: entity.url,
        thumbnailUrl: entity.thumbnailUrl);
  }
}
