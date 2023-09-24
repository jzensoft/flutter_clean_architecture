import 'package:go_router/go_router.dart';
import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';
import 'package:photo_clean_architecture/features/photo/presentation/pages/bookmark/bookmark_page.dart';
import 'package:photo_clean_architecture/features/photo/presentation/pages/detail/detail_page.dart';
import 'package:photo_clean_architecture/features/photo/presentation/pages/home/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: "/",
        builder: (context, state) {
          return const MyHomePage(title: "Photo App");
        },
        routes: <RouteBase>[
          GoRoute(
              path: "bookmark",
              builder: (context, state) {
                return const BookmarkPage();
              }),
          GoRoute(
              path: "detail",
              builder: (context, state) {
                final PhotoEntity data = state.extra as PhotoEntity;
                return DetailPage(
                  title: data.title,
                  photoEntity: data,
                );
              })
        ])
  ],
);
