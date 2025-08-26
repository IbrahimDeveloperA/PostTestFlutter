part of 'posts_list_bloc.dart';

sealed class PostsListEvent extends Equatable {
  const PostsListEvent();

  @override
  List<Object?> get props => [];
}

final class LoadPostsListEvent extends PostsListEvent {
  const LoadPostsListEvent({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}


