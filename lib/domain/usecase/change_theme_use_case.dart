import 'package:injectable/injectable.dart';
import 'package:test_flutter/domain/repository/settings_repository.dart';
import '../../core/usecase/usecase.dart';

@lazySingleton
class ChangeThemeUseCase implements UseCase<void, bool> {
  ChangeThemeUseCase(this._repository);

  final SettingsRepository _repository;

  @override
  Future<void> call({bool? params}) {
    return _repository.setTheme(params ?? false);
  }
}
