import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/constants/app_constants.dart';
import 'get_it.dart';

@module
abstract class InjectableModule {

  @lazySingleton
  Talker talker() => TalkerFlutter.init(
    settings: TalkerSettings(
      maxHistoryItems: 30,
      titles: {TalkerLogType.exception.toString(): 'Error: '},
      enabled: true,
    ),
  );

  @lazySingleton
  TalkerDioLogger talkerDioLogger() {
    final Talker talker = getIt<Talker>();
    return TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestData: true,
        printRequestHeaders: true,
        printResponseData: true,
        printResponseMessage: true,
      ),
    );
  }

  @lazySingleton
  Dio dio() {
    final Dio dio = Dio(
      BaseOptions(baseUrl: AppConstants.baseUrl,followRedirects: true,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    final TalkerDioLogger talkerDioLogger = getIt<TalkerDioLogger>();

    dio.interceptors.add(talkerDioLogger);
    return dio;
  }

}