import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_flutter/router/app_router.dart';

import '../ui/setting/cubit/theme_cubit.dart';
import 'di/get_it.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.getTheme ? ThemeMode.dark : ThemeMode.light,
            routerConfig: _appRouter.config(
              navigatorObservers: () => [
                TalkerRouteObserver(
                  GetIt.I<Talker>(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
