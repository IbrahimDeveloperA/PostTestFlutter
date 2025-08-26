import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter/data/models/post_model.dart';
import 'package:test_flutter/core/resources/data_state.dart'; // тут у тебя DataState

@lazySingleton
class PostApiService {
  PostApiService(this._dio);

  final Dio _dio;

  Future<DataState<List<PostModel>>> getPosts() async {
    try {
      final Response response = await _dio.get('posts');

      final List<dynamic> data = response.data as List<dynamic>;
      final List<PostModel> posts =
          data.map((json) => PostModel.fromJson(json)).toList();

      return DataSuccess(posts);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

    Future<DataState<PostModel>> getDetailPost({required int id}) async {
    try {
      final Response response = await _dio.get('posts/$id');

      final data = response.data;
      final PostModel post = PostModel.fromJson(data);

      return DataSuccess(post);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
