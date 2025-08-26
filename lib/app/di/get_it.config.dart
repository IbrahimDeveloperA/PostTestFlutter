// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart' as _i162;
import 'package:talker_flutter/talker_flutter.dart' as _i207;
import 'package:test_flutter/app/di/injectable_module.dart' as _i76;
import 'package:test_flutter/data/remote/post_api_service.dart' as _i338;
import 'package:test_flutter/data/repository/post_repository_impl.dart'
    as _i307;
import 'package:test_flutter/domain/repository/post_repository.dart' as _i767;
import 'package:test_flutter/domain/usecase/get_detail_post_use_case.dart'
    as _i659;
import 'package:test_flutter/domain/usecase/get_posts_use_case.dart' as _i482;
import 'package:test_flutter/ui/detail/bloc/detail_post_bloc.dart' as _i431;
import 'package:test_flutter/ui/posts_list/bloc/posts_list_bloc.dart' as _i545;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i207.Talker>(() => injectableModule.talker());
    gh.lazySingleton<_i162.TalkerDioLogger>(
        () => injectableModule.talkerDioLogger());
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio());
    gh.lazySingleton<_i338.PostApiService>(
        () => _i338.PostApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i767.PostRepository>(
        () => _i307.PostRepositoryImpl(gh<_i338.PostApiService>()));
    gh.lazySingleton<_i482.GetPostsUseCase>(
        () => _i482.GetPostsUseCase(gh<_i767.PostRepository>()));
    gh.lazySingleton<_i659.GetDetailPostUseCase>(
        () => _i659.GetDetailPostUseCase(gh<_i767.PostRepository>()));
    gh.factory<_i545.PostsListBloc>(
        () => _i545.PostsListBloc(gh<_i482.GetPostsUseCase>()));
    gh.factory<_i431.DetailPostBloc>(
        () => _i431.DetailPostBloc(gh<_i659.GetDetailPostUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i76.InjectableModule {}
