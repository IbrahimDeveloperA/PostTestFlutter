import 'package:auto_route/auto_route.dart';
import 'package:test_flutter/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PostsListRoute.page, initial: true),
        AutoRoute(page: DetailPostRoute.page),
        AutoRoute(page: SettingRoute.page),
      ];
}
