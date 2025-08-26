import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_flutter/router/app_router.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(
            GetIt.I<Talker>(),
          )
        ],
      ),
    );
  }
}
