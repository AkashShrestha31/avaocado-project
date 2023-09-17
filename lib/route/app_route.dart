import 'package:avocado/features/api_post/presentations/pages/api_post_page.dart';
import 'package:avocado/features/home/presentations/pages/choice_page.dart';
import 'package:avocado/features/post/presentations/pages/post_page.dart';
import 'package:avocado/features/video/data/model/video_list_component.dart';
import 'package:avocado/features/video/presentations/pages/video_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  AppRoute._();

  static GoRouter goRouter = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: <GoRoute>[
        GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const ChoicePage()),
        GoRoute(
            path: '/video',
            name: 'video',
            builder: (context, state) => const VideoListPage()),
        GoRoute(
            path: '/apiPost',
            name: 'apiPost',
            builder: (context, state) => const ApiPostPage()),
        GoRoute(
          path: '/post',
          name: 'post',
          builder: (context, state) {
            VideoListComponentModel videoListComponentModel =
                state.extra as VideoListComponentModel;
            return PostPage(
              videoListComponentModel: videoListComponentModel,
            );
          },
        )
      ]);
}
