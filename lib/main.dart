import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_clean_architecture/config/routes/app_route.dart';
import 'package:photo_clean_architecture/features/photo/presentation/bloc/photo/local/local_photo_bloc.dart';
import 'package:photo_clean_architecture/features/photo/presentation/bloc/photo/remote/remote_photo_bloc.dart';
import 'package:photo_clean_architecture/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final remotePhotoBloc =
        BlocProvider(create: (context) => RemotePhotoBloc(sl(), sl()));
    final localPhotoBloc =
        BlocProvider(create: (context) => LocalPhotoBloc(sl()));

    return MultiBlocProvider(
      providers: [remotePhotoBloc, localPhotoBloc],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
