import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_clean_architecture/features/photo/presentation/bloc/photo/remote/remote_photo_bloc.dart';
import 'package:photo_clean_architecture/features/photo/presentation/widgets/photo_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<RemotePhotoBloc>().add(GetPhotos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            GestureDetector(
              onTap: () => context.go("/bookmark"),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.bookmark),
              ),
            )
          ],
        ),
        body: BlocBuilder<RemotePhotoBloc, RemotePhotoState>(
          builder: (context, state) {
            if (state is RemotePhotoLoading) {
              return const Center(
                child: Text("Loading..."),
              );
            }
            if (state is RemotePhotoError) {
              return const Center(
                child: Text("Error..."),
              );
            }
            if (state is RemotePhotoDone) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return PhotoWidget(
                    photoEntity: state.photos![index],
                    onViewDetail: (data) {
                      context.push("/detail", extra: data);
                    },
                  );
                },
                itemCount: state.photos!.length,
              );
            }
            return const SizedBox();
          },
        ));
  }
}
