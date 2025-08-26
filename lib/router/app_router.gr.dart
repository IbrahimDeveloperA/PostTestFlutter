// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:test_flutter/ui/detail/detail_post_screen.dart' as _i1;
import 'package:test_flutter/ui/posts_list/posts_screen.dart' as _i2;
import 'package:test_flutter/ui/setting/setting_screen.dart' as _i3;

/// generated route for
/// [_i1.DetailPostScreen]
class DetailPostRoute extends _i4.PageRouteInfo<DetailPostRouteArgs> {
  DetailPostRoute({
    _i5.Key? key,
    required int postId,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         DetailPostRoute.name,
         args: DetailPostRouteArgs(key: key, postId: postId),
         initialChildren: children,
       );

  static const String name = 'DetailPostRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailPostRouteArgs>();
      return _i1.DetailPostScreen(key: args.key, postId: args.postId);
    },
  );
}

class DetailPostRouteArgs {
  const DetailPostRouteArgs({this.key, required this.postId});

  final _i5.Key? key;

  final int postId;

  @override
  String toString() {
    return 'DetailPostRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [_i2.PostsListScreen]
class PostsListRoute extends _i4.PageRouteInfo<void> {
  const PostsListRoute({List<_i4.PageRouteInfo>? children})
    : super(PostsListRoute.name, initialChildren: children);

  static const String name = 'PostsListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.PostsListScreen();
    },
  );
}

/// generated route for
/// [_i3.SettingScreen]
class SettingRoute extends _i4.PageRouteInfo<void> {
  const SettingRoute({List<_i4.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SettingScreen();
    },
  );
}
