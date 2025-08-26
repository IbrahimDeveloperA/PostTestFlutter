import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter/domain/models/post.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/usecase/get_posts_use_case.dart';

part 'posts_list_event.dart';

part 'posts_list_state.dart';

@injectable
class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  PostsListBloc(
    this._getPostsUseCase,
  ) : super(LoadingPostsListState()) {
    on<LoadPostsListEvent>(_loadPosts);
    on<SearchPostsListEvent>(_searchPosts);
  }

  final GetPostsUseCase _getPostsUseCase;

  List<Post> _allPosts = [];

  Future<void> _loadPosts(
    LoadPostsListEvent event,
    Emitter<PostsListState> emit,
  ) async {
    try {
      if (state is! LoadedPostsListState) {
        emit(LoadingPostsListState());
      }
      final DataState<List<Post>> dataState = await _getPostsUseCase();

      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        _allPosts = dataState.data!;
        emit(LoadedPostsListState(post: _allPosts));
      } else if (dataState is DataFailed) {
        emit(ErrorPostsListState(error: dataState.error!));
      }
    } catch (_) {
      emit(ErrorPostsListState());
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _searchPosts(
    SearchPostsListEvent event,
    Emitter<PostsListState> emit,
  ) async {
    try {
      if (_allPosts.isEmpty) return;

      final List<Post> filtered = _allPosts
          .where((p) => p.title.trim().toLowerCase().startsWith(event.query))
          .toList();
      if (filtered.isEmpty) {
        return emit(
            EmptyPostsListState(message: AppConstants.messageEmptyList));
      }

      emit(LoadedPostsListState(post: filtered));
    } finally {
      event.completer?.complete();
    }
  }
}
