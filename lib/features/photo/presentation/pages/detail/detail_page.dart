import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';
import 'package:photo_clean_architecture/features/photo/presentation/bloc/photo/local/local_photo_bloc.dart';

class DetailPage extends StatefulWidget {
  final PhotoEntity? photoEntity;
  final String title;

  const DetailPage({super.key, required this.title, this.photoEntity});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(widget.photoEntity!.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<LocalPhotoBloc>().add(SavePhoto(widget.photoEntity!));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black,
              content: Text('Article saved successfully.'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
