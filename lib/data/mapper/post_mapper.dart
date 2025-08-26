import '../../domain/models/post.dart';
import '../models/post_model.dart';

extension PostMapper on PostModel {
  Post toEntity() => Post(
    id: id,
    userId: userId,
    title: title,
    body: body,
  );
}

extension PostEntityMapper on Post {
  PostModel toModel() => PostModel(
    id: id,
    userId: userId,
    title: title,
    body: body,
  );
}
