import 'package:test_flutter/domain/models/post.dart';
import '../../core/resources/data_state.dart';

abstract class PostRepository {
  Future<DataState<List<Post>>> getPosts();

  Future<DataState<Post>> getDetailPost({required int id});
}
