import 'package:injectable/injectable.dart';

import '../../core/usecase/usecase.dart';
import '../models/post.dart';
import '../params/find_post_by_name_params.dart';
import '../repository/post_repository.dart';

@lazySingleton
class FindPostByNameUseCase
    implements UseCase<List<Post>, FindPostByNameParams> {
  FindPostByNameUseCase(this._repo);

  final PostRepository _repo;

  @override
  Future<List<Post>> call({FindPostByNameParams? params}) {
    return _repo.findPostsByName(
        listPost: params?.listPost ?? [], name: params?.query ?? '');
  }
}
