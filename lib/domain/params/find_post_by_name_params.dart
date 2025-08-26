import '../models/post.dart';

class FindPostByNameParams {
  final List<Post> listPost;
  final String query;

  const FindPostByNameParams({required this.listPost, required this.query});
}
