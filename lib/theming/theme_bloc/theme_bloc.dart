import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:practice/theming/custom_theme.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLight(themeData: lightTheme)) {
    on<ToggleTheme>((event, emit) {
      if (state is ThemeLight) {
        emit(ThemeDark(themeData: darkTheme));
      } else {
        emit(ThemeLight(themeData: lightTheme));
      }
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      final isDark = json['isDark'] as bool;
      return isDark
          ? ThemeDark(themeData: darkTheme)
          : ThemeLight(themeData: lightTheme);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'isDark': state is ThemeDark};
  }
}
