part of 'detail_post_bloc.dart';

sealed class DetailPostState extends Equatable {
  const DetailPostState();

  @override
  List<Object?> get props => [];
}

final class LoadingPostState extends DetailPostState {}

final class LoadedPostsState extends DetailPostState {
  const LoadedPostsState({required this.post});

  final Post post;

  @override
  List<Object> get props => [post];
}

final class ErrorPostsListState extends DetailPostState {
  const ErrorPostsListState({this.error});

  final DioException? error;

  @override
  List<Object?> get props => [error];
}
