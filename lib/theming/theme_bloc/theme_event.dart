import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {}

class ToggleTheme extends ThemeEvent {
  @override
  List<Object> get props => [];
}
