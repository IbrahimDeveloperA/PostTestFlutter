import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter/domain/usecase/get_detail_post_use_case.dart';

import '../../../core/resources/data_state.dart';
import '../../../domain/models/post.dart';

part 'detail_post_event.dart';

part 'detail_post_state.dart';

@injectable
class DetailPostBloc extends Bloc<DetailPostEvent, DetailPostState> {
  DetailPostBloc(this._getDetailPostUseCase) : super(LoadingPostState()) {
    on<LoadPostEvent>(_loadPost);
  }

  final GetDetailPostUseCase _getDetailPostUseCase;

  void _loadPost(
    LoadPostEvent event,
    Emitter<DetailPostState> emit,
  ) async {
    try{
      if (state is! LoadedPostsState) {
        emit(LoadingPostState());
      }
      final DataState<Post> dataState =
      await _getDetailPostUseCase(params: event.postId);
      if (dataState is DataSuccess && dataState.data != null) {
        emit(LoadedPostsState(post: dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(ErrorPostsListState(error: dataState.error!));
      }
    }catch(error){
      emit(ErrorPostsListState());
    }finally {
      event.completer?.complete();
    }

  }
}
