import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter/domain/models/post.dart';

import '../../../core/resources/data_state.dart';
import '../../../domain/usecase/get_posts_use_case.dart';

part 'posts_list_event.dart';

part 'posts_list_state.dart';

@injectable
class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  PostsListBloc(this._getPostsUseCase) : super(LoadingPostsListState()) {
    on<LoadPostsListEvent>(_loadPosts);
  }

  final GetPostsUseCase _getPostsUseCase;

  void _loadPosts(
    LoadPostsListEvent event,
    Emitter<PostsListState> emit,
  ) async {
    try {
      if (state is! LoadedPostsListState) {
        emit(LoadingPostsListState());
      }
      final DataState<List<Post>> dataState = await _getPostsUseCase();
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(LoadedPostsListState(post: dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(ErrorPostsListState(error: dataState.error!));
      }
    } catch (error) {
      emit(ErrorPostsListState());
    } finally {
      event.completer?.complete();
    }
  }
}
