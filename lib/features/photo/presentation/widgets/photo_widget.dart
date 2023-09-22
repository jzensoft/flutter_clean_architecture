import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';

class PhotoWidget extends StatelessWidget {
  final PhotoEntity? photoEntity;
  final Function(PhotoEntity)? onViewDetail;
  final Function(PhotoEntity)? onRemove;

  const PhotoWidget(
      {super.key, this.photoEntity, required this.onViewDetail, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onViewDetail != null) {
          onViewDetail!(photoEntity!);
        }
      },
      child: Container(
        padding: const EdgeInsetsDirectional.all(7),
        child: Row(
          children: [
            _buildImage(),
            Flexible(
              child: Text(photoEntity!.title),
            ),
            if (onRemove != null)
              GestureDetector(
                onTap: () {
                  if (onRemove != null) {
                    onRemove!(photoEntity!);
                  }
                },
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.remove),
                ),
              )
            else
              const SizedBox()
          ],
        ),
      ),
    );
  }

  _buildImage() {
    return CachedNetworkImage(
      imageUrl: photoEntity!.thumbnailUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
