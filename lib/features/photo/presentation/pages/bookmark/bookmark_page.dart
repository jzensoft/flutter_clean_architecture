import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_clean_architecture/features/photo/presentation/bloc/photo/local/local_photo_bloc.dart';
import 'package:photo_clean_architecture/features/photo/presentation/widgets/photo_widget.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    context.read<LocalPhotoBloc>().add(GetSavedPhoto());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
      ),
      body: BlocBuilder<LocalPhotoBloc, LocalPhotoState>(
        builder: (context, state) {
          if (state is LocalPhotoLoading) {
            return const Center(
              child: Text("Loading..."),
            );
          }
          if (state is LocalPhotoDone) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return PhotoWidget(
                  photoEntity: state.photos![index],
                  onViewDetail: (data) {},
                  onRemove: (data) {
                    context.read<LocalPhotoBloc>().add(RemovePhoto(data));
                  },
                );
              },
              itemCount: state.photos!.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
