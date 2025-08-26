part of 'detail_post_bloc.dart';

sealed class DetailPostEvent extends Equatable {
  const DetailPostEvent();

  @override
  List<Object?> get props => [];
}

final class LoadPostEvent extends DetailPostEvent {
  const LoadPostEvent({required this.postId, this.completer});

  final int postId;
  final Completer? completer;

  @override
  List<Object?> get props => [postId,completer];
}
