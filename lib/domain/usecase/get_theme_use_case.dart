import 'package:injectable/injectable.dart';
import '../repository/settings_repository.dart';

@lazySingleton
class GetThemeUseCase {
  GetThemeUseCase(this._repository);

  final SettingsRepository _repository;

  bool call({void params}) {
    return _repository.getTheme();
  }
}
