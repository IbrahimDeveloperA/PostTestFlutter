part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.getTheme});

  final bool getTheme;

  @override
  List<Object?> get props => [getTheme];
}
