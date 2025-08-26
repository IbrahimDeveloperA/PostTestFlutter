import 'package:injectable/injectable.dart';
import 'package:test_flutter/data/models/post_model.dart';
import '../../core/resources/data_state.dart';
import '../../domain/models/post.dart';
import '../../domain/repository/post_repository.dart';
import '../mapper/post_mapper.dart';
import '../remote/post_api_service.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostApiService _api;

  PostRepositoryImpl(this._api);

  @override
  Future<DataState<List<Post>>> getPosts() async {
    final DataState<List<PostModel>> result = await _api.getPosts();
    return result.map(
      (List<PostModel> models) =>
          models.map((PostModel post) => post.toEntity()).toList(),
    );
  }

  @override
  Future<DataState<Post>> getDetailPost({required int id}) async {
    final DataState<PostModel> result = await _api.getDetailPost(id: id);
    return result.map((PostModel model) => model.toEntity());
  }
}
