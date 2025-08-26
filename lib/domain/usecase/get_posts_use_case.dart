import 'package:injectable/injectable.dart';
import 'package:test_flutter/core/resources/data_state.dart';
import '../../core/usecase/usecase.dart';
import '../models/post.dart';
import '../repository/post_repository.dart';

@lazySingleton
class GetPostsUseCase implements UseCase<DataState<List<Post>>, void> {
  final PostRepository _repo;

  GetPostsUseCase(this._repo);

  @override
  Future<DataState<List<Post>>> call({void params}) {
    return _repo.getPosts();
  }
}
