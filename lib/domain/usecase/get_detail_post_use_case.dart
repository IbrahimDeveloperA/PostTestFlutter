import 'package:injectable/injectable.dart';

import '../../core/resources/data_state.dart';
import '../../core/usecase/usecase.dart';
import '../models/post.dart';
import '../repository/post_repository.dart';

@lazySingleton
class GetDetailPostUseCase implements UseCase<DataState<Post>, int> {
  GetDetailPostUseCase(this._repo);

  final PostRepository _repo;

  @override
  Future<DataState<Post>> call({int? params}) {
    return _repo.getDetailPost(id: params!);
  }
}

