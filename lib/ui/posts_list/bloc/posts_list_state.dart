part of 'posts_list_bloc.dart';

sealed class PostsListState extends Equatable {
  const PostsListState();

  @override
  List<Object?> get props => [];
}

final class LoadingPostsListState extends PostsListState {}

final class LoadedPostsListState extends PostsListState {
  const LoadedPostsListState({required this.post});

  final List<Post> post;

  @override
  List<Object> get props => [post];
}

final class ErrorPostsListState extends PostsListState {
  const ErrorPostsListState({this.error});

  final DioException? error;

  @override
  List<Object?> get props => [error];
}

final class EmptyPostsListState extends PostsListState {
  const EmptyPostsListState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
