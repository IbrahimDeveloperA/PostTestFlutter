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

final class SearchPostsListEvent extends PostsListEvent {
  const SearchPostsListEvent(this.query, {this.completer});

  final String query;
  final Completer? completer;

  @override
  List<Object?> get props => [query, completer];
}
