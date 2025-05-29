part of 'theme_lib.dart';

final class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit() : super(ThemeMode.system);

  /// [toggle] function that switch the current theme
  /// with the opposite value.
  /// example: dark -> light // or // light -> dark


  void toggle() async {
    log('Mode: $state', name: 'ThemeCubit');
    switch (state) {
      case ThemeMode.dark:
        {
          emit(ThemeMode.light);
          return;
        }
      case ThemeMode.light:
        {
          emit(ThemeMode.dark);
          return;
        }

      case ThemeMode.system:
        {
          Brightness brightness =
              WidgetsBinding.instance.platformDispatcher.platformBrightness;
          if (brightness == Brightness.light) {
            emit(ThemeMode.dark);
          } else {
            emit(ThemeMode.light);
          }
          return;
        }
    }
  }

  /// [setDarkMode] function that set the theme mode to dark.
  void setDarkMode() async {
    emit(ThemeMode.dark);
  }

  /// [setLightMode] function that set the theme mode to light.
  void setLightMode() async {
    emit(ThemeMode.light);
  }

  /// [isLight] is a [bool] getter that return boolean value
  /// results of logical operation which check if the current [state]
  /// is equal to [ThemeMode.light]
  bool get isLight => state == ThemeMode.light;
}
