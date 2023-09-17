import 'package:avocado/core/helper_class/size_config.dart';
import 'package:avocado/core/theme/theme_color.dart';
import 'package:avocado/features/video/presentations/pages/video_list_page.dart';
import 'package:avocado/route/app_route.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRoute.goRouter.routerDelegate,
      routeInformationProvider: AppRoute.goRouter.routeInformationProvider,
      routeInformationParser: AppRoute.goRouter.routeInformationParser,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: themeColor,
          brightness: Brightness.light,
          tabBarTheme: ThemeData().tabBarTheme.copyWith(
                labelColor: themeColor.onSurface,
                unselectedLabelColor: themeColor.onSurfaceVariant,
                labelPadding: const EdgeInsets.all(8),
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: themeColor.onSurface),
                  ),
                ),
              )),
    );
  }
}
