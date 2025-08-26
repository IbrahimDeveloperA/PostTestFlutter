import 'package:injectable/injectable.dart';
import '../../domain/repository/settings_repository.dart';
import '../local/local_storage.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._localStorage);

  final LocalStorage _localStorage;

  @override
  bool getTheme() {
    return _localStorage.getTheme();
  }

  @override
  Future<void> setTheme(bool value)async {
    await _localStorage.changeTheme(value);
  }
}
