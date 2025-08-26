import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter/domain/usecase/change_theme_use_case.dart';
import 'package:test_flutter/domain/usecase/get_theme_use_case.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(
    this._getTheme,
    this._changeTheme,
  ) : super(ThemeState(getTheme: _getTheme.call()));

  final GetThemeUseCase _getTheme;
  final ChangeThemeUseCase _changeTheme;

  void changeTheme(bool value) {
    _changeTheme.call(params: value);
    emit(ThemeState(getTheme: _getTheme.call()));
  }
}
